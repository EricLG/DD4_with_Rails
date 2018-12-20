class AbilityBonus < ActiveRecord::Base
  belongs_to :ability,    inverse_of: :ability_bonuses
  belongs_to :character,  inverse_of: :ability_bonuses

  has_many :skill_bonuses

  def to_s
    Ability.unconvert(self.ability.name)
  end

  # Permet de calculer le total d'une caractéristique lors de la création d'un personnage pour la case bonus level
  def total_bonus_level
    total = 0
    [level_4, level_8, level_11, level_14, level_18, level_21, level_24, level_28].each do |l|
      total += l
    end
    total
  end

  # Modificateur de la caractéristique
  def modifier(current_value = nil)
    value = self.total_value || current_value
    (value / 2 - 5).floor
  end
end
