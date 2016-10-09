class CommonWeapon < ActiveRecord::Base

  belongs_to :source
  belongs_to :weapon_category
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :weapon_properties

  enum two_handed: { one: 1, two: 2, double: 3}
  def category
    self.weapon_category.name
  end
end
