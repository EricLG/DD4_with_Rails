class MagicItemSearch
  include ActiveModel::Model

  FIELDS = %i[name object_levels source weapon_groups armor_categories implement_group location rarity].freeze
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

    return search if params.empty?

    name_params             = params.delete(:name)
    source_params           = params.delete(:source)
    object_levels_params    = params.delete(:object_levels)
    implement_group_params  = params.delete(:implement_groups)
    rarity_params           = params.delete(:rarity)
    locations_params        = params.delete(:location)          || []
    weapon_groups_params    = params.delete(:weapon_groups)     || []
    armor_categories_params = params.delete(:armor_categories)  || []

    search = search.where(params)
    search = search.where('magic_items.name ILIKE ?', "%#{name_params}%") if name_params
    search = search.joins(:object_levels).where('object_levels.level <= ?', object_levels_params) if object_levels_params
    search = search.joins(:source).where(source: source_params) if source_params
    search = search.joins(:weapon_groups).where(weapon_groups: { id: weapon_groups_params }) unless weapon_groups_params.reject(&:empty?).empty?
    search = search.joins(:armor_categories).where(armor_categories: { id: armor_categories_params }) unless armor_categories_params.reject(&:empty?).empty?
    search = search.joins(:implement_group).where(implement_group: { id: implement_group_params }) if implement_group_params
    search = search.joins(:location).where(location: locations_params) unless locations_params.reject(&:empty?).empty?
    search = search.where(rarity: MagicItem.rarities[rarity_params]) if rarity_params
    search
  end

  def find_type(type)
    case type.to_s
    when 'weapons'
      MagicItem.weapons
    when 'armors'
      MagicItem.armors
    when 'implements'
      MagicItem.implements
    when 'gears'
      MagicItem.gears
    when 'amulets'
      MagicItem.amulets
    else
      MagicItem
    end
  end
end
