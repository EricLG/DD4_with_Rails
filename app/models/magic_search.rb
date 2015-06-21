class MagicSearch
  include ActiveModel::Model


   FIELDS = %i(name object_levels source weapon_groups armor_categories implement_groups locations)
  attr_accessor(*FIELDS)

  attr_accessor :params, :klass

  def initialize(params = nil, klass = nil)
    super(params)
    @klass = klass
  end

  def build_search
    params = {}
    FIELDS.each do |p|
      v = send(p)
      params[p] = v if v && !v.blank?
    end

    if params.empty?
      find_klass(klass)
    else
      name_params             = params.delete(:name)
      source_params           = params.delete(:source)
      object_levels_params    = params.delete(:object_levels)
      implement_groups_params = params.delete(:implement_groups)
      locations_params        = params.delete(:locations)         || []
      weapon_groups_params    = params.delete(:weapon_groups)     || []
      armor_categories_params = params.delete(:armor_categories)  || []

      search = find_klass(klass).where(params)

      if name_params
        search = search.where("#{klass.table_name}.name ILIKE ?", "%#{name_params}%")
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

      if implement_groups_params
        search = search.joins(:implement_groups).where(implement_groups: {id: implement_groups_params})
      end

      unless locations_params.reject(&:empty?).empty?
        search = search.joins(:location).where(location: locations_params)
      end

      search
    end
  end

  def find_klass(klass)
    case klass.to_s
    when "MagicWeapon"
      MagicWeapon.includes(:object_levels, :source, :weapon_groups)
    when "MagicArmor"
      MagicArmor.includes(:object_levels, :source, :armor_categories)
    when "MagicImplement"
      MagicImplement.includes(:object_levels, :source, :implement_groups)
    when "MagicGear"
      MagicGear.includes(:object_levels, :source, :locations)
    end
  end
end
