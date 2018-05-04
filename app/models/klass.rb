class Klass < ActiveRecord::Base

  belongs_to :source
  #belongs_to :available_skills, :class_name => 'Skill'
  #has_many :skills
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :weapon_categories
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :features, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_klasses_for_feat
  #has_and_belongs_to_many :available_skills, :class_name => "Skill", :join_table => :available_skills_for_klass
  #has_and_belongs_to_many :required_skills, :class_name => "Skill", :join_table => :required_skills_for_klass

  ARCANIC_KLASS = ["Barde", "Ensorceleur", "Façonneur", "Mage lames", "Magicien", "Sorcier"]
  DIVINE_KLASS = ["Invocateur", "Paladin", "Prêtre", "Prêtre des runes", "Vengeur"]
  MARTIAL_KLASS = ["Guerrier", "Maître de guerre", "Rôdeur", "Voleur"]
  PRIMAL_KLASS = ["Barbare", "Druide", "Gardien", "Limier", "Shaman"]
  PSIONIC_KLASS = ["Batailleur", "Flamboyant", "Moine", "Psion"]

  GRANT_FORMATION_SKILL = ["Barde", "Druide", "Ensorceleur", "Façonneur", "Gardien", "Invocateur", "Limier", "Mage lames", "Magicien", "Paladin", "Prêtre", "Prêtre des runes", "Rôdeur", "Shaman", "Vengeur", "Voleur"]
  GRANT_ONLY_ONE_FORMATION_SKILL = ["Barde", "Druide", "Ensorceleur", "Façonneur", "Gardien", "Invocateur", "Limier", "Mage lames", "Magicien", "Paladin", "Prêtre", "Prêtre des runes", "Shaman", "Vengeur"]

  def self.grouped_klass(klasses)
    klasses_to_s = ""
    if ARCANIC_KLASS.all? { |i| (klasses).include?(i) }
      klasses_to_s = "toute classe arcanique"
    elsif DIVINE_KLASS.all? { |i| klasses.include?(i) }
      klasses_to_s = "toute classe divine"
    elsif MARTIAL_KLASS.all? { |i| klasses.include?(i) }
      klasses_to_s = "toute classe martiale"
    elsif PRIMAL_KLASS.all? { |i| klasses.include?(i) }
      klasses_to_s = "toute classe primale"
    elsif PSIONIC_KLASS.all? { |i| klasses.include?(i) }
      klasses_to_s = "toute classe psionique"
    else
      klasses_to_s = klasses.join(' ou ')
    end
    klasses_to_s
  end

  def is_divine?
    self.power_source == 'divine'
  end

  def resume_skill_bonus_list(list)
    Skill.convert_list(list)
  end

  # Retourne un tableau de compétences de classes obligatoires
  def required_skills_to_a
    self.required_skills.split(', ')
  end

  # Retourne un tableau contenant la liste des compétences de classes
  def choosable_skills_to_a
    self.trained_skills.split(', ')
  end

  # Retourne true si la classe offre gratuitement 1 formation
  def grant_formation_skill?
    GRANT_FORMATION_SKILL.include?(self.name)
  end

  def have_only_one_required_skill?
    GRANT_ONLY_ONE_FORMATION_SKILL.include?(self.name)
  end
end
