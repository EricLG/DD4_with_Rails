class Ability < ActiveRecord::Base
  has_many :ability_bonuses, inverse_of: :abilities
  has_many :characters, through: :ability_bonuses

  ABILITIES = %w[strength constitution dexterity intelligence wisdom charisma].freeze

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

  def self.unconvert(long_ability)
    ability = case long_ability
              when 'strength'
                'For 2'
              when 'constitution'
                'Con 2'
              when 'dexterity'
                'Dex 2'
              when 'intelligence'
                'Int 2'
              when 'wisdom'
                'Sag 2'
              when 'charisma'
                'Cha 2'
              end
    ability
  end
end
