class Race < ApplicationRecord
  include ImagePath
  belongs_to :source
  has_and_belongs_to_many :features, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, class_name: 'Feat', join_table: :pr_races_for_feat

  # Utiliser pour déterminer les langues connnus à la création d'un personnage
  def known_level_1_languages
    str_language = self.language.split(', ').map(&:capitalize)
    Language.where(language: str_language)
  end

  # Utiliser pour déterminer les langues à choisir à la création d'un personnage
  def available_level_1_languages
    languages = if self.name == 'Goliath'
                  Language.where(language: %w[Nain Géant])
                else
                  Language.where(level_1: true).where.not(language: self.known_level_1_languages.map(&:language))
                end
    languages
  end

  # Seules 2 races donnent un bonus au choix
  def grant_dynamic_racial_skill_bonus?
    self.name == 'Cristallien' || self.name == 'Kalashtar'
  end

  # Affiche les bonus de compétences en francais avec le montant du bonus
  def resume_skill_bonuses
    skills = []
    skill_bonuses.split(', ').each do |s|
      if Skill::SKILLS_EN.include?(s)
        skills << Skill::SKILLS_CONVERSION_FR[s] + ' +2'
      elsif s == 'bonus'
        skills << '+2 dans une autre compétence au choix'
      end
    end
    skills.join(', ')
  end

  # Retourne les bonus de compétences sous la forme d'un tableau. Les bonus au choix ne sont pas retournés
  def skill_bonuses_to_a
    skills = []
    self.skill_bonuses.split(', ').each do |sb|
      skills << sb if Skill::SKILLS_EN.include?(sb)
    end
    skills
  end

  # Retourne un tableau des compétences choisissables lors d'un bonus racial au choix (+2 dans une autre compétence)
  def choosable_skill_bonus_to_a
    race_bonus_skill_list = []
    race_bonus_skill_list = %w[arcana endurance] if self.name == 'Cristallien'
    race_bonus_skill_list = %w[insight] if self.name == 'Kalashtar'
    skills = Skill::SKILLS_EN - race_bonus_skill_list
    skills
  end

  def grant_dynamic_training_skill?
    self.name == 'Éladrin' || self.name == 'Humain'
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

  def self.weapons_proficiencies(race_name)
    weapons = case race_name
              when 'Éladrin'
                CommonWeapon.eladrinWeapon
              when 'Elfe'
                CommonWeapon.elfeWeapon
              when 'Nain'
                CommonWeapon.dwarfWeapon
              else
                []
              end
    weapons
  end

  def self.race_defenses_bonus(defense, race_name)
    bonus = case race_name
            when 'Changelin', 'Éladrin', 'Goliath'
              { CA: 0, Vig: 0, Ref: 0, Vol: 1 }
            when 'Humain'
              { CA: 0, Vig: 1, Ref: 1, Vol: 1 }
            else
              { CA: 0, Vig: 0, Ref: 0, Vol: 0 }
            end
    bonus[defense]
  end
end
