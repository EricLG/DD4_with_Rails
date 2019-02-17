class SkillBonus < ActiveRecord::Base
  belongs_to :skill, inverse_of: :skill_bonuses
  belongs_to :character, inverse_of: :skill_bonuses
  belongs_to :ability_bonus

  scope :select_ability_total_bonus, -> { select('skill_bonuses.*, ability_bonuses.total_value AS ability_bonus_value') }
  scope :select_skill_name, -> { select('skill_bonuses.*, skills.name AS skill_name') }

  scope :acrobatics,    -> { joins(:skill).where(skills: { name: :acrobatics }).first }
  scope :arcana,        -> { joins(:skill).where(skills: { name: :arcana }).first }
  scope :athletics,     -> { joins(:skill).where(skills: { name: :athletics }).first }
  scope :bluff,         -> { joins(:skill).where(skills: { name: :bluff }).first }
  scope :diplomacy,     -> { joins(:skill).where(skills: { name: :diplomacy }).first }
  scope :dungeoneering, -> { joins(:skill).where(skills: { name: :dungeoneering }).first }
  scope :endurance,     -> { joins(:skill).where(skills: { name: :endurance }).first }
  scope :heal,          -> { joins(:skill).where(skills: { name: :heal }).first }
  scope :history,       -> { joins(:skill).where(skills: { name: :history }).first }
  scope :insight,       -> { joins(:skill).where(skills: { name: :insight }).first }
  scope :intimidate,    -> { joins(:skill).where(skills: { name: :intimidate }).first }
  scope :nature,        -> { joins(:skill).where(skills: { name: :nature }).first }
  scope :perception,    -> { joins(:skill).where(skills: { name: :perception }).first }
  scope :religion,      -> { joins(:skill).where(skills: { name: :religion }).first }
  scope :stealth,       -> { joins(:skill).where(skills: { name: :stealth }).first }
  scope :streetwise,    -> { joins(:skill).where(skills: { name: :streetwise }).first }
  scope :thievery,      -> { joins(:skill).where(skills: { name: :thievery }).first }

  def fr_name
    Skill::SKILLS_CONVERSION_FR[self.skill.name]
  end
end
