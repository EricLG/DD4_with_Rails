class MagicItemSearch
  include ActiveModel::Model

  FIELDS = %i(name object_levels source weapon_groups armor_categories implement_group location)
  attr_accessor(*FIELDS)

  attr_accessor :params, :item_type

  def initialize(params = nil, item_type = nil)
    super(params)
    @item_type = item_type
  end

  def build_search()
    params = {}
    FIELDS.each do |p|
      v = send(p)
      params[p] = v if v && !v.blank?
    end

    search = find_type(self.item_type).includes(:object_levels, :source, :weapon_groups, :armor_categories, :implement_group, :location)

    unless params.empty?
      name_params             = params.delete(:name)
      source_params           = params.delete(:source)
      object_levels_params    = params.delete(:object_levels)
      implement_group_params = params.delete(:implement_groups)
      locations_params        = params.delete(:location)          || []
      weapon_groups_params    = params.delete(:weapon_groups)     || []
      armor_categories_params = params.delete(:armor_categories)  || []

      search = search.where(params)
      if name_params
        search = search.where("magic_items.name ILIKE ?", "%#{name_params}%")
      end

      if object_levels_params
        search = search.joins(:object_levels).where("object_levels.level <= ?", object_levels_params)
      end

      if source_params
        search = search.joins(:source).where(source: source_params)
      end

      unless weapon_groups_params.reject(&:empty?).empty?
        search = search.joins(:weapon_groups).where(weapon_groups: {id: weapon_groups_params})
      end

      unless armor_categories_params.reject(&:empty?).empty?
        search = search.joins(:armor_categories).where(armor_categories: {id: armor_categories_params})
      end

      if implement_group_params
        search = search.joins(:implement_group).where(implement_group: {id: implement_group_params})
      end

      unless locations_params.reject(&:empty?).empty?
        search = search.joins(:location).where(location: locations_params)
      end

    end
    search
  end

  def find_type(type)
    case type.to_s
    when "weapons"
      MagicItem.weapons
    when "armors"
      MagicItem.armors
    when "implements"
      MagicItem.implements
    when "gears"
      MagicItem.gears
    else
      MagicItem
    end
  end
end
