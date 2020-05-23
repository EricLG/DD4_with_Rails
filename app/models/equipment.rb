class Equipment < ApplicationRecord
  belongs_to :character
  belongs_to :equipped_magic_item, foreign_key: :magic_item_id, class_name: 'MagicItem'
  belongs_to :location

  SELECT_NAMES = 'equipment.*, characters.name as hero_name, magic_items.name as item_name, locations.name as location_name'.freeze

  scope :select_names, -> { joins(:character, :equipped_magic_item, :location).select(SELECT_NAMES) }
  scope :load_relation, -> { joins(:location, :equipped_magic_item).select('equipment.*, magic_items.*') }
  scope :main_weapon, -> { load_relation.where('locations.code': Location::WEAPON).first }
  scope :second_hand, -> { load_relation.where('locations.code': Location::SECOND_HAND).first }
end
