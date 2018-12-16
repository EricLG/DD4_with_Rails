class Character < ActiveRecord::Base

  enum status: { draft: 1, ability_done: 2, skill_done: 3, complete: 10}

  belongs_to :user
  belongs_to :race
  belongs_to :klass
  belongs_to :god

  has_and_belongs_to_many :games
  before_destroy { games.clear }

  has_many :wishlists, dependent: :delete_all
  has_many :players, dependent: :delete_all
  has_many :choices, inverse_of: :character, dependent: :delete_all

  has_many :magic_items , through: :wishlists
  has_many :campaigns , through: :players
  has_many :features, through: :choices
  has_many :languages, through: :choices

  # Relation des caractéristiques
  has_many :abilities, through: :ability_bonuses, source: :ability
  has_many :ability_bonuses, inverse_of: :character
  accepts_nested_attributes_for :ability_bonuses

  # Relation des compétences
  has_many :skills, through: :skill_bonuses, source: :skill
  has_many :skill_bonuses, inverse_of: :character
  accepts_nested_attributes_for :skill_bonuses

  has_many :klass_choices,  -> {klass_features_choices},  class_name: "Choice"
  has_many :race_choices,   -> {race_features_choices},   class_name: "Choice"

  NEW_ABILITIES_LEVEL = [4, 8, 11, 14, 18, 21, 24, 28]
  DEFAULT_ABILITIES = [10, 10, 10, 10, 10, 8]
  ALIGNMENT = [["Bon", "Bon"], ["Loyal bon", "Loyal bon"], ["Mauvais", "Mauvais"], ["Chaotique mauvais", "Chaotique mauvais"], ["Non aligné", "Non aligné"]]

  # Retourne une string des langages parlés
  def show_languages
    if self.languages.empty?
      "Vous ne parlez aucune langue. C'est dommage."
    else
      self.languages.map(&:language).join(", ")
    end
  end

  # Vérifie si le statut du héros est dans l'état voulue ou s'il a passé cette étape. Pseudo machine à état
  # wanted_status : string représentant des états
  def compare_status_to(wanted_status)
    Character.statuses[self.status] >= Character.statuses[wanted_status]
  end

  def is_paragon?
    level >= 11 if level
  end

  def is_epic?
    level >= 21 if level
  end

  # Renvoie le bonus de 1/2 niveau
  def half_level
    (self.level/2).floor
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
          level_11: self.is_paragon? ? 1 : 0,
          level_21: self.is_epic? ? 1 : 0
        )
      end
    end
    return self.ability_bonuses.joins(:ability)
  end

  # Retourne le bonus racial choisi selon un tableau de ability_bonuses
  def racial_bonus_chosen(char_abilities)
    chosen = []
    char_abilities.each do |ab|
      chosen << ab.to_s if (ab.bonus_racial > 0)
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
        ab = ability_bonuses.joins(:ability).where(abilities: {name: Skill.get_linked_carac(skill.name)}).first
        SkillBonus.create(
          character: self,
          skill: skill,
          ability_bonus: ab,
          racial: race_bonus_skill_static.include?(skill.name) ? 2 : 0,
          training: self.check_training_for_skill(skill, class_bonus_skill_static)
        )
      end
    end
    return self.skill_bonuses.joins(:skill).sort_by(&:fr_name)
  end

  # retourne la valeur de la formation : 5 si la compétence est obligatoire (Druide / nature), 0 sinon
  def check_training_for_skill(s, class_bonus_skill_static)
    if (Klass::GRANT_ONLY_ONE_FORMATION_SKILL.include?(self.klass.name) && class_bonus_skill_static.first == s.name)
      trained = 5
    else
      trained = 0
    end
    trained
  end

  # Retourne vrai si le bonus de compétence racial dynamique (cristallien, kalashtar) a déjà été choisi
  def racial_skill_bonus_chosen?(skill_abilities, skill_bonus_list)
    chosen = false
    skill_abilities.each do |sb|
      if (sb.racial == 2 && skill_bonus_list.include?(sb.skill.name))
        chosen = true
      end
    end
    chosen
  end

  # Return the total formation for a character from his race or class
  def total_formation_skills_number
    total = self.klass.skills_number
    total +=1 if self.race.grant_dynamic_formation_skill?
    total +=1 if self.klass.grant_formation_skill?
    total
  end

  # Feature - Renvoie une aptitude donnant un bonus de compétence. Actuellement seules 2 aptitudes raciales donnent un tel bonus
  def show_formation_bonus_rule(features)
    feature = nil
    if self.race.grant_dynamic_formation_skill?
      feature = features.main_ft.find do |f|
        f.name == "Compétence supplémentaire" || f.name == "Éducation éladrine"
      end
    end
    feature
  end

  def chosen_skill_formation
    chosen_skill = {}
    self.skill_bonuses.joins(:skill).map{|s| chosen_skill[s.skill.name] = s.training }
    chosen_skill
  end

  # Array - Génère des caractéristiques aléatoires pour un personnage
  def self.random_abilities
    Array.new(6) {Character.random_ability}.sort {|x,y| y <=> x }
  end

  # Int - Retourne une valeur de caractéristique entre 3 et 18
  def self.random_ability
    Array.new(4) {Character.dice}.sort.last(3).inject{|acc, i| acc+=i}
  end

  # Int - Lance 1d6
  def self.dice
    rand(1..6)
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
    self.level = case (self.experience/1000).to_f
    when 0 ... 1
      1
    when 1 ... 2.25
      2
    when 2.25 ... 3.75
      3
    when 3.75 ... 5.5
      4
    when 5.5 ... 7.5
      5
    when 7.5 ... 10
      6
    when 10 ... 13
      7
    when 13 ... 16.5
      8
    when 16.5 ... 20.5
      9
    when 20.5 ... 26
      10
    when 26 ... 32
      11
    when 32 ... 39
      12
    when 39 ... 47
      13
    when 47 ... 57
      14
    when 57 ... 69
      15
    when 69 ... 83
      16
    when 83 ... 99
      17
    when 99 ... 119
      18
    when 119 ... 143
      19
    when 143 ... 175
      20
    when 175 ... 210
      21
    when 210 ... 255
      22
    when 255 ... 310
      23
    when 310 ... 375
      24
    when 375 ... 450
      25
    when 450 ... 550
      26
    when 550 ... 675
      27
    when 675 ... 825
      28
    when 825 ... 1000
      29
    else
      30
    end if self.experience
  end
end
