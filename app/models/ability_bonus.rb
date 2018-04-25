class AbilityBonus < ActiveRecord::Base

  belongs_to :ability,    inverse_of: :ability_bonuses
  belongs_to :character,  inverse_of: :ability_bonuses

  def to_s
    Ability.unconvert(self.ability.name)
  end

  def total_bonus_level
    total = 0
    total += self.level_4  if self.level_4
    total += self.level_8  if self.level_8
    total += self.level_11  if self.level_11
    total += self.level_14 if self.level_14
    total += self.level_18  if self.level_18
    total += self.level_21  if self.level_21
    total += self.level_24  if self.level_24
    total += self.level_28 if self.level_28
    total
  end

  def modifier(current_value = nil)
    value = current_value ? current_value : self.total_value
    (value/2 - 5).floor
  end

end
