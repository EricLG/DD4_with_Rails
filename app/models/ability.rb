class Ability < ActiveRecord::Base

  has_many :ability_bonuses, inverse_of: :abilities
  has_many :characters, through: :ability_bonuses

  ABILITIES = %w(strength constitution dexterity intelligence wisdom charisma)
end
