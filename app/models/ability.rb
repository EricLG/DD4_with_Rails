class Ability < ActiveRecord::Base

  has_many :ability_bonuses, inverse_of: :abilities
  has_many :characters, through: :ability_bonuses

  ABILITIES = %w(strength constitution dexterity intelligence wisdom charisma)

  def self.convert(short_ability)
    ability = case short_ability
      when 'For 2'
        'strength'
      when 'Con 2'
        'constitution'
      when 'Dex 2'
        'dexterity'
      when 'Int 2'
        'intelligence'
      when 'Sag 2'
        'wisdom'
      when 'Cha 2'
        'charisma'
      end
    ability
  end
end
