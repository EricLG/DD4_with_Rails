class WeaponProperty < ApplicationRecord
  has_and_belongs_to_many :common_weapons
end
