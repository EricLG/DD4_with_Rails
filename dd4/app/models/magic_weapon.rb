class MagicWeapon < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :object_levels
end
