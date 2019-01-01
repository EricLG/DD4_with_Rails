class WeaponGroup < ActiveRecord::Base
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :magic_items

  def self.find_weapon_groups(groups, group)
    group.split(', ').collect { |weapon| groups.find { |wg| wg.name == weapon } }
  end
end
