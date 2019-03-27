class WeaponGroup < ActiveRecord::Base
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :magic_items

  # Relation pour le choix des talents d'un personnage
  has_many :chosen_feats, inverse_of: :weapon_groups
  has_many :characters, through: :chosen_feats
  def self.find_weapon_groups(groups, group)
    group.split(', ').collect { |weapon| groups.find { |wg| wg.name == weapon } }
  end
end
