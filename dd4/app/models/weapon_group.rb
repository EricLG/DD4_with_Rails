class WeaponGroup < ActiveRecord::Base
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :common_armors
  has_and_belongs_to_many :magic_weapons
end
