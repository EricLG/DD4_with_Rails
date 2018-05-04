class SkillBonus < ActiveRecord::Base

  belongs_to :skill,    inverse_of: :skill_bonuses
  belongs_to :character,  inverse_of: :skill_bonuses

  belongs_to :ability_bonus

  def fr_name
    Skill::SKILLS_CONVERSION_FR[self.skill.name]
  end
end
