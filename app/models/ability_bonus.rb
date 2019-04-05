class AbilityBonus < ApplicationRecord
  belongs_to :ability,    inverse_of: :ability_bonuses
  belongs_to :character,  inverse_of: :ability_bonuses

  has_many :skill_bonuses
  FORT_ABILITIES = %i[strength constitution].freeze
  REF_ABILITIES = %i[dexterity intelligence].freeze
  WILL_ABILITIES = %i[wisdom charisma].freeze

  scope :select_ability_name, -> { select('ability_bonuses.*, abilities.name AS ability_name') }

  scope :strength,      -> { joins(:ability).where(abilities: { name: :strength }).order(total_value: :desc).first }
  scope :constitution,  -> { joins(:ability).where(abilities: { name: :constitution }).order(total_value: :desc).first }
  scope :dexterity,     -> { joins(:ability).where(abilities: { name: :dexterity }).order(total_value: :desc).first }
  scope :intelligence,  -> { joins(:ability).where(abilities: { name: :intelligence }).order(total_value: :desc).first }
  scope :wisdom,        -> { joins(:ability).where(abilities: { name: :wisdom }).order(total_value: :desc).first }
  scope :charisma,      -> { joins(:ability).where(abilities: { name: :charisma }).order(total_value: :desc).first }

  scope :fortitude, -> { joins(:ability).where(abilities: { name: FORT_ABILITIES }).order(total_value: :desc).first }
  scope :reflexes,  -> { joins(:ability).where(abilities: { name: REF_ABILITIES }).order(total_value: :desc).first }
  scope :will,      -> { joins(:ability).where(abilities: { name: WILL_ABILITIES }).order(total_value: :desc).first }

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
