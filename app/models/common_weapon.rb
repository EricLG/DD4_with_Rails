class CommonWeapon < ApplicationRecord
  belongs_to :source
  belongs_to :weapon_category
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :weapon_properties

  enum two_handed: { one: 1, two: 2, double: 3 }

  # Scopes
  scope :eladrinWeapon, -> { where(name: 'Épée longue') }
  scope :elfeWeapon, -> { where(name: ['Arc court', 'Arc long']) }
  scope :dwarfWeapon, -> { where(name: ['Marteau de lancer', 'Marteau de guerre']) }

  HAND_FREE_WEAPONS = ['Gantelet cloutés', 'Mains nues'].freeze

  def category
    self.weapon_category.name
  end

  def hand_free?
    HAND_FREE_WEAPONS.include?(self.name)
  end
end
