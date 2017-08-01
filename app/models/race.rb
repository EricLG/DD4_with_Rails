class Race < ActiveRecord::Base

  belongs_to :source
  has_many :stats, autosave: true
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

  def grant_skill_bonus
    self.name == 'Cristallien' || self.name == 'Kalashtar'
  end

end
