class AbilityBonus < ActiveRecord::Base

  belongs_to :ability,    inverse_of: :ability_bonuses
  belongs_to :character,  inverse_of: :ability_bonuses

end
