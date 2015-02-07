class WeaponCategory < ActiveRecord::Base
  has_many :common_weapons
  has_many :common_armors
end
