class Klass < ApplicationRecord
  include ImagePath
  belongs_to :source
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :weapon_categories
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :features, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, class_name: 'Feat', join_table: :pr_klasses_for_feat

  ARCANIC_KLASS = ['Barde', 'Ensorceleur', 'Façonneur', 'Mage lames', 'Magicien', 'Sorcier'].freeze
  DIVINE_KLASS = ['Invocateur', 'Paladin', 'Prêtre', 'Prêtre des runes', 'Vengeur'].freeze
  MARTIAL_KLASS = ['Guerrier', 'Maître de guerre', 'Rôdeur', 'Voleur'].freeze
  PRIMAL_KLASS = ['Barbare', 'Druide', 'Gardien', 'Limier', 'Shaman'].freeze
  PSIONIC_KLASS = ['Batailleur', 'Flamboyant', 'Moine', 'Psion'].freeze

  GRANT_TRAINING_SKILL = ['Barde', 'Druide', 'Ensorceleur', 'Façonneur', 'Gardien', 'Invocateur', 'Limier', 'Mage lames', 'Magicien', 'Paladin', 'Prêtre', 'Prêtre des runes', 'Rôdeur', 'Shaman', 'Vengeur', 'Voleur'].freeze
  GRANT_ONLY_ONE_TRAINING_SKILL = ['Barde', 'Druide', 'Ensorceleur', 'Façonneur', 'Gardien', 'Invocateur', 'Limier', 'Mage lames', 'Magicien', 'Paladin', 'Prêtre', 'Prêtre des runes', 'Shaman', 'Vengeur'].freeze

  def self.grouped_klass(klasses)
    klasses_to_s = if ARCANIC_KLASS.all? { |i| klasses.include?(i) }
                     'toute classe arcanique'
                   elsif DIVINE_KLASS.all? { |i| klasses.include?(i) }
                     'toute classe divine'
                   elsif MARTIAL_KLASS.all? { |i| klasses.include?(i) }
                     'toute classe martiale'
                   elsif PRIMAL_KLASS.all? { |i| klasses.include?(i) }
                     'toute classe primale'
                   elsif PSIONIC_KLASS.all? { |i| klasses.include?(i) }
                     'toute classe psionique'
                   else
                     klasses.join(' ou ')
                   end
    klasses_to_s
  end

  def divine?
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
  def grant_training_skill?
    GRANT_TRAINING_SKILL.include?(self.name)
  end

  def only_one_required_skill?
    GRANT_ONLY_ONE_TRAINING_SKILL.include?(self.name)
  end

  # int[] - Retourne un tableau d'id d'armes avec maniement
  def mastered_weapon_proficiencies
    self.weapon_categories.map(&:common_weapons).flatten.map(&:id) + self.common_weapons.map(&:id)
  end

  # CommonWeapons[]
  def weapons_proficiencies
    self.weapon_categories.map(&:common_weapons).flatten. + self.common_weapons
  end

  # { string_fr: string_en }
  def main_abilities
    abilities_h = {}
    self.main_stats.split(', ').first(2).each do |a|
      abilities_h[a] = Ability.abilities_fr_to_en(a.downcase)
    end
    abilities_h
  end

  def self.klass_defenses_bonus(defense, klass_name)
    bonus = case klass_name
            when 'Barbare', 'Gardien', 'Guerrier'
              { CA: 0, Vig: 2, Ref: 0, Vol: 0 }
            when 'Barde', 'Druide', 'Limier', 'Sorcier'
              { CA: 0, Vig: 0, Ref: 1, Vol: 1 }
            when 'Batailleur', 'Ensorceleur', 'Mage lames', 'Magicien', 'Prêtre', 'Prêtre des runes', 'Psion'
              { CA: 0, Vig: 0, Ref: 0, Vol: 2 }
            when 'Façonneur', 'Flamboyant', 'Maître de guerre', 'Shaman'
              { CA: 0, Vig: 1, Ref: 0, Vol: 1 }
            when 'Invocateur', 'Moine', 'Paladin', 'Vengeur'
              { CA: 0, Vig: 1, Ref: 1, Vol: 1 }
            when 'Rôdeur'
              { CA: 0, Vig: 1, Ref: 1, Vol: 0 }
            when 'Voleur'
              { CA: 0, Vig: 0, Ref: 2, Vol: 0 }
            else
              { CA: 0, Vig: 0, Ref: 0, Vol: 0 }
            end
    bonus[defense]
  end
end
