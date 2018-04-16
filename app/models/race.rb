class Race < ActiveRecord::Base

  belongs_to :source
  #has_many :stats, autosave: true
  belongs_to :skill
  has_and_belongs_to_many :features, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_races_for_feat

  # Utiliser pour déterminer les langues connnus à la création d'un personnage
  def known_level_1_languages
    str_language = self.language.split(", ").map(&:capitalize)
    return Language.where(language: str_language)
  end

  # Utiliser pour déterminer les langues à choisir à la création d'un personnage
  def available_level_1_languages
    if self.name == 'Goliath'
      languages = Language.where(language: ['Nain', 'Géant'])
    else
      languages = Language.where(level_1: true).where.not(language: self.known_level_1_languages.map(&:language))
    end
    languages
  end

  # Seules 2 races donnent un bonus au choix
  def grant_dynamic_racial_skill_bonus
    self.name == 'Cristallien' || self.name == 'Kalashtar'
  end

  def grant_dynamic_formation_skill?
    self.name == 'Éladrin' || self.name == 'Humain'
  end

  # Wrapper pour récupérer la compétence s de la race
  def race_skill(s)
    skill = self.skill.try(:send, "#{s}")
    return skill ? skill : (Skill.new.send(s))
  end

  def ability_to_a
    self.ability_bonuses.split(' ou ')
  end

  # Retourne le premier choix de caracteristique possible en tableau de string
  # ['strength', etc.]
  def default_ability_racial_bonus
    default_bonus = []
    self.ability_to_a[0].split(', ').each do |a|
      default_bonus << Ability.convert(a)
    end
    default_bonus
  end
end
