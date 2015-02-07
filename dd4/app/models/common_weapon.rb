class CommonWeapon < ActiveRecord::Base

# attr_accessible :name, :type, :weight, :price, :damage, :handling,:range, :two_handed, :source_id, :category_id

  belongs_to :source
  belongs_to :weapon_category
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :weapon_properties
end
