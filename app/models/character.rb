class Character < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  enum status: { draft: 1, ability_done: 2, skill_done: 3, complete: 10 }

  belongs_to :user
  belongs_to :race
  belongs_to :klass
  belongs_to :god

  has_and_belongs_to_many :games
  before_destroy { games.clear }

  has_many :wishlists, dependent: :delete_all
  has_many :players, dependent: :delete_all
  has_many :choices, inverse_of: :character, dependent: :delete_all

  has_many :magic_items, through: :wishlists
  has_many :campaigns, through: :players
  has_many :features, through: :choices
  has_many :languages, through: :choices

  # Relation des caractéristiques
  has_many :ability_bonuses, inverse_of: :character
  has_many :abilities, through: :ability_bonuses, source: :ability
  accepts_nested_attributes_for :ability_bonuses

  # Relation des compétences
  has_many :skills, through: :skill_bonuses, source: :skill
  has_many :skill_bonuses, inverse_of: :character
  accepts_nested_attributes_for :skill_bonuses

  # Relation des talents
  has_many :chosen_feats
  has_many :feats, through: :chosen_feats
  has_many :f_languages, through: :chosen_feats, source: :language
  has_many :f_skills, through: :chosen_feats, source: :skill
  has_many :f_abilities, through: :chosen_feats, source: :ability
  has_many :f_weapon_groups, through: :chosen_feats, source: :weapon_group
  has_many :f_implement_groups, through: :chosen_feats, source: :implement_group
  accepts_nested_attributes_for :chosen_feats

  has_many :klass_choices,  -> { klass_features_choices },  class_name: 'Choice'
  has_many :race_choices,   -> { race_features_choices },   class_name: 'Choice'

  # Relation de l'équipement possédés
  belongs_to :main_weapon, class_name: 'CommonWeapon'
  belongs_to :second_hand, polymorphic: true # CommonWeapon or CommonArmor
  belongs_to :armor, class_name: 'CommonArmor'
  belongs_to :main_implement, class_name: 'Implement'
  belongs_to :second_implement, class_name: 'Implement'

  has_many :equipment
  has_many :equipped_magic_items, through: :equipment

  # Scope
  scope :select_race_name, -> { joins(:race).select('races.id as race_id, races.name as race_name') }
  scope :select_klass_name, -> { joins(:klass).select('klasses.id as klass_id, klasses.name as klass_name') }
  scope :show, ->(id) { select('characters.*').select_race_name.select_klass_name.find_by_id(id) }

  NEW_ABILITIES_LEVEL = [4, 8, 11, 14, 18, 21, 24, 28].freeze
  DEFAULT_ABILITIES = [10, 10, 10, 10, 10, 8].freeze
  ALIGNMENT = [
    %w[Bon Bon],
    %w[Loyal\ bon Loyal\ bon],
    %w[Mauvais Mauvais],
    %w[Chaotique\ mauvais Chaotique\ mauvais],
    %w[Non\ aligné Non\ aligné]
  ].freeze

  RITUAL_CASTER = %w[Barde Druide Invocateur Magicien Prêtre Psion].freeze

  def armor_with_heavy_info
    CommonArmor.select_category.where(id: self.armor_id).first
  end

  def constitution
    self.ability_bonuses.constitution
  end

  def default_image
    File.join('mini_icones', "#{self.race.try(&:normalize_str)}.jpg")
  end

  # Retourne une string des langues parlés
  def show_languages
    racial_languages = self.languages.empty? ? [Struct.new(:language).new('Commun')] : self.languages
    feat_languages = self.chosen_feats.languages
    (racial_languages + feat_languages).flatten.map(&:language).sort.join(', ')
  end

  # Vérifie si le statut du héros est dans l'état voulue ou s'il a passé cette étape. Pseudo machine à état
  # wanted_status : string représentant des états
  def compare_status_to(wanted_status)
    Character.statuses[self.status] >= Character.statuses[wanted_status]
  end

  def paragon?
    level >= 11 && level <21 if level
  end

  def epic?
    level >= 21 if level
  end

  def max_feats
    max_feat = self.level / 2 + 1
    max_feat += 1 if self.race.name == 'Humain'
    max_feat += 1 if self.paragon?
    max_feat += 1 if self.epic?
    max_feat
  end

  def bonus_per_tier(heroic_bonus = 1, paragon_bonus = 2, epic_bonus = 3)
    if self.epic?
      epic_bonus
    elsif self.paragon?
      paragon_bonus
    else
      heroic_bonus
    end
  end

  # Renvoie le nom du personnage sous forme de chemin correct
  def path_name
    name.mb_chars.downcase.tr(' ', '_').parameterize
  end

  # Renvoie le bonus de 1/2 niveau
  def half_level
    (self.level / 2).floor
  end

  # On ne peut avoir que 6 caractéristiques : Force, Constitution, etc.
  # Renvoie les 6 ability_bonuses triées
  def initialize_ability_bonuses
    if self.ability_bonuses.map(&:ability).map(&:name).sort != Ability::ABILITIES.sort
      self.ability_bonuses.destroy_all
      abilities = Ability.all
      abilities.each do |a|
        br = self.race.default_ability_racial_bonus.include?(a.name) ? 2 : 0
        AbilityBonus.create(
          character: self,
          ability: a,
          initial_value: (a == abilities.last ? 8 : 10),
          bonus_racial: br,
          level_11: self.paragon? ? 1 : 0,
          level_21: self.epic? ? 1 : 0
        )
      end
    end
    self.ability_bonuses.joins(:ability)
  end

  # Retourne le bonus racial choisi selon un tableau de ability_bonuses
  def racial_bonus_chosen(char_abilities)
    chosen = []
    char_abilities.each do |ab|
      chosen << ab.to_s if ab.bonus_racial > 0
    end
    chosen.join(', ')
  end

  # void - Calcul et affecte l'attribut total_value de chaque AbilityBonus d'un personnage
  def calcul_abilities
    self.ability_bonuses.each do |ab|
      ab.total_value = ab.initial_value + ab.bonus_racial + ab.bonus_klass + ab.level_4 + ab.level_8 + ab.level_11 + ab.level_14 + ab.level_18 + ab.level_21 + ab.level_28 + ab.level_24 + ab.bonus_parangon + ab.bonus_epic
    end
  end

  # Initialise les skill_bonuses en assignant les bonus de compétences raciaux et les formations
  def initialize_skill_bonuses(race_bonus_skill_static, class_bonus_skill_static, ability_bonuses)
    if self.skill_bonuses.map(&:skill).map(&:name).sort != Skill::SKILLS_EN.sort
      self.skill_bonuses.destroy_all
      skills = Skill.all
      skills.each do |skill|
        ab = ability_bonuses.joins(:ability).where(abilities: { name: Skill.get_linked_carac(skill.name) }).first
        SkillBonus.create(
          character: self,
          skill: skill,
          ability_bonus: ab,
          racial: race_bonus_skill_static.include?(skill.name) ? 2 : 0,
          training: self.check_training_for_skill(skill, class_bonus_skill_static)
        )
      end
    end
    self.skill_bonuses.joins(:skill).sort_by(&:fr_name)
  end

  # retourne la valeur de la formation : 5 si la compétence est obligatoire (Druide / nature), 0 sinon
  def check_training_for_skill(skill, class_bonus_skill_static)
    trained = if Klass::GRANT_ONLY_ONE_TRAINING_SKILL.include?(self.klass.name) && class_bonus_skill_static.first == skill.name
                5
              else
                0
              end
    trained
  end

  # Retourne vrai si le bonus de compétence racial dynamique (cristallien, kalashtar) a déjà été choisi
  def racial_skill_bonus_chosen?(skill_abilities, skill_bonus_list)
    chosen = false
    skill_abilities.each do |sb|
      chosen = true if sb.racial == 2 && skill_bonus_list.include?(sb.skill.name)
    end
    chosen
  end

  # Return the total training for a character from his race or class
  def total_training_skills_number
    total = self.klass.skills_number
    total += 1 if self.race.grant_dynamic_training_skill?
    total += 1 if self.klass.grant_training_skill?
    total
  end

  # Feature - Renvoie une aptitude donnant un bonus de compétence. Actuellement seules 2 aptitudes raciales donnent un tel bonus
  def show_training_bonus_rule(features)
    feature = nil
    if self.race.grant_dynamic_training_skill?
      feature = features.main_ft.find do |f|
        f.name == 'Compétence supplémentaire' || f.name == 'Éducation éladrine'
      end
    end
    feature
  end

  def chosen_training_skill
    chosen_skill = {}
    self.skill_bonuses.joins(:skill).map { |s| chosen_skill[s.skill.name] = s.training }
    chosen_skill
  end

  # For rogue and thief
  def validate_skill_training(skill_bonuses_attributes, skills)
    required_skill_chosen = false
    skill_choices = self.skill_bonuses.joins(:skill).where(skills: { name: skills })
    skill_bonuses_attributes.each do |param|
      appropriate_skill = skill_choices[0].id.to_s == param.last['id'] || skill_choices[1].id.to_s == param.last['id']
      required_skill_chosen = true if appropriate_skill && param.last['training'] == '5'
    end
    required_skill_chosen
  end

  # Array - Génère des caractéristiques aléatoires pour un personnage
  def self.random_abilities
    Array.new(6) { Character.random_ability }.sort { |x, y| y <=> x }
  end

  # Int - Retourne une valeur de caractéristique entre 3 et 18
  def self.random_ability
    Array.new(4) { Character.dice }.sort.last(3).inject { |acc, i| acc += i }
  end

  # Int - Lance 1d6
  def self.dice
    rand(1..6)
  end

  # CommonWeapons[] - Return an array of commonweapon whom the character is proficient with
  def proficiencies(chosen_feats)
    racial_proficiencies = Race.weapons_proficiencies(self.race_name)
    klass_proficiencies = self.klass.weapons_proficiencies
    feats_proficiencies = [chosen_feats.select { |cf| cf.feat.name == 'Maniement d\'arme'}.first&.proficiency] || []
    weapons = racial_proficiencies + klass_proficiencies + feats_proficiencies
    weapons.flatten.uniq.compact
  end

  def level_to_xp
    self.experience = case self.level
                      when 2
                        1_000
                      when 3
                        2_250
                      when 4
                        3_750
                      when 5
                        5_500
                      when 6
                        7_500
                      when 7
                        10_000
                      when 8
                        13_000
                      when 9
                        16_500
                      when 10
                        20_500
                      when 11
                        26_000
                      when 12
                        32_000
                      when 13
                        39_000
                      when 14
                        47_000
                      when 15
                        57_000
                      when 16
                        69_000
                      when 17
                        83_000
                      when 18
                        99_000
                      when 19
                        119_000
                      when 20
                        143_000
                      when 21
                        175_000
                      when 22
                        210_000
                      when 23
                        255_000
                      when 24
                        310_000
                      when 25
                        375_000
                      when 26
                        450_000
                      when 27
                        550_000
                      when 28
                        675_000
                      when 29
                        825_000
                      when 30
                        1_000_000
                      else
                        0
                      end
  end

  def xp_to_level
    return unless self.experience

    self.level = case (self.experience / 1000).to_f
                 when 0...1
                   1
                 when 1...2.25
                   2
                 when 2.25...3.75
                   3
                 when 3.75...5.5
                   4
                 when 5.5...7.5
                   5
                 when 7.5...10
                   6
                 when 10...13
                   7
                 when 13...16.5
                   8
                 when 16.5...20.5
                   9
                 when 20.5...26
                   10
                 when 26...32
                   11
                 when 32...39
                   12
                 when 39...47
                   13
                 when 47...57
                   14
                 when 57...69
                   15
                 when 69...83
                   16
                 when 83...99
                   17
                 when 99...119
                   18
                 when 119...143
                   19
                 when 143...175
                   20
                 when 175...210
                   21
                 when 210...255
                   22
                 when 255...310
                   23
                 when 310...375
                   24
                 when 375...450
                   25
                 when 450...550
                   26
                 when 550...675
                   27
                 when 675...825
                   28
                 when 825...1000
                   29
                 else
                   30
                 end
  end
end
