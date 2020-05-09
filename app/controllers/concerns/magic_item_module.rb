module MagicItemModule
  extend ActiveSupport::Concern

  def search_show_relation(item)
    item_level = item.object_levels.order(:level)
    left_level_group, right_level_group = item_level.in_groups(2)
    item_hash = {
      item: item,
      item_armor_categories: item.armor_categories.map(&:name),
      item_weapon_groups: item.weapon_groups.order(:name).map(&:name),
      item_level_min: item_level.level_min,
      left_level_group: left_level_group,
      right_level_group: right_level_group
    }
    item_hash
  end
end
