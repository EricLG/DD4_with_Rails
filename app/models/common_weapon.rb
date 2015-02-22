class CommonWeapon < ActiveRecord::Base

  belongs_to :source
  belongs_to :weapon_category
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :weapon_properties
end
