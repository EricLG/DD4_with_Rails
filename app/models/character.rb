class Character < ActiveRecord::Base

  enum status: { draft: 1, complete: 2}

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

  has_many :abilities, through: :ability_bonuses, source: :ability
  has_many :ability_bonuses, inverse_of: :character
  accepts_nested_attributes_for :ability_bonuses

  has_many :klass_choices,  -> {klass_features_choices},  class_name: "Choice"
  has_many :race_choices,   -> {race_features_choices},   class_name: "Choice"
  has_many :skill_choices, through: :choices, source: :skill

  LEVEL_STATS = %w(4 8 11 14 18 21 24 28)
  DEFAULT_STATS = [10, 10, 10, 10, 10, 8]
  ALIGNMENT = [["Bon", "Bon"], ["Loyal bon", "Loyal bon"], ["Mauvais", "Mauvais"], ["Chaotique mauvais", "Chaotique mauvais"], ["Non aligné", "Non aligné"]]

  def self.meta_store_accessor
    eval "store_accessor :stats, :racial_stat_id"
  end

  meta_store_accessor

  def show_languages
    if self.languages.empty?
      "Vous ne parlez aucune langue. C'est dommage."
    else
      self.languages.map(&:language).join(", ")
    end
  end

  def stats_defined?
    !self.level_1_strength.nil?
  end

  def total_stat(carac)
    total_carac = self.send("level_1_#{carac}").to_i
    LEVEL_STATS.each do |l|
      total_carac += self.send("level_#{l}_#{carac}").to_i if level >= l.to_i
    end
    total_carac += self.racial_stats.send(carac).to_i if racial_stat_id
    return total_carac
  end

  def racial_stats
    Stat.find(racial_stat_id)
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
          bonus_racial: br
        )
      end
    end
    return self.ability_bonuses.joins(:ability)
  end

  def is_paragon?
    level >= 11 if level
  end

  def is_epic?
    level >= 21 if level
  end

  # Initialise ou recherche les choix de compétences liés à la classe (les formations)
  def klass_formations_choices
    skill = Skill.joins(:choice).where(choices: {character_id: self.id}).find_or_create_by(origin: "klass_formations_choices")
    unless self.skill_choices.include?(skill)
      self.skill_choices << skill
    end
    skill
  end

  # Initialise ou recherche les choix de compétences liés à la race (typiquement le cristallien et le kalashtar)
  def race_bonus_skill_choices
    skill = Skill.joins(:choice).where(choices: {character_id: self.id}).find_or_create_by(origin: "racial_bonus_choice")
    unless self.skill_choices.include?(skill)
      self.skill_choices << skill
    end
    skill
  end

  # Retourne un tableau des compétences disponibles lors d'un bonus racial (+2 au choix)
  def race_bonus_skill_available
    skills = []
    Skill::SKILL.each do |s|
      skills << s unless self.race.race_skill(s) == 2
    end
    skills
  end

  # Return the total formation for a character from his race or class
  def total_formation_skills_number
    total = self.klass.skills_number
    total +=1 if self.race.grant_dynamic_formation_skill?
    total +=1 if self.klass.grant_formation_skill?
    total
  end

  # Retourne un hash avec les différents bonus (racial, demi-niveau, etc.) par compétence
  def skill_bonus
    skill_bonus = {}
    Skill.get_skills.each do |s, fr_skill|
      skill_bonus[s] = {
        :link_carac => Skill.get_linked_carac(s),
        :racial_bonus => self.race.race_skill(s) + self.race_bonus_skill_choices.send(s),
        :carac_bonus_plus_half_level => count_carac_bonus_plus_half_level(self, s),
        :bg => self.klass.available_skills.to_a.include?(s) ? "bg" : ""
      }
    end
    skill_bonus
  end

  # Compte le bonus de caractérisque + le 1/2 niveau en fonction du personnage et de la compétence
  def count_carac_bonus_plus_half_level(character, skill)
    carac = character.total_stat(Skill.get_linked_carac(skill))
    bonus = (character.level / 2) + ((carac-10)/2)
    bonus.floor
  end

  def show_formation_bonus_rule(features)
    feature = nil
    if self.race.grant_dynamic_formation_skill?
      feature = features.main_ft.find do |f|
        f.name == "Compétence supplémentaire" || f.name == "Éducation éladrine"
      end
    end
    feature
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
