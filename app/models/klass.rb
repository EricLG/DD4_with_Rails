class Klass < ActiveRecord::Base

  belongs_to :source
  belongs_to :available_skills, :class_name => 'Skill'
  has_many :skills
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :weapon_categories
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :features, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_klasses_for_feat
  #has_and_belongs_to_many :available_skills, :class_name => "Skill", :join_table => :available_skills_for_klass
  has_and_belongs_to_many :required_skills, :class_name => "Skill", :join_table => :required_skills_for_klass

  GRANT_FORMATION_SKILL = ["Barde", "Druide", "Ensorceleur", "Façonneur", "Gardien", "Invocateur", "Limier", "Mage lames", "Magicien", "Paladin", "Prêtre", "Prêtre des runes", "Rôdeur", "Shaman", "Vengeur", "Voleur"]
  def is_divine?
    self.power_source == 'divine'
  end

  # Retourne true si la classe offre gratuitement 1 formation
  def grant_formation_skill?
    GRANT_FORMATION_SKILL.include?(self.name)
  end
end
