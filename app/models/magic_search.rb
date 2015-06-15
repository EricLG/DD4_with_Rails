class MagicSearch
  include ActiveModel::Model


   FIELDS = %i(name object_levels source weapon_groups armor_categories)
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
      klass.all
    else
      name_params             = params.delete(:name)
      object_levels_params    = params.delete(:object_levels)
      source_params           = params.delete(:source)
      weapon_groups_params    = params.delete(:weapon_groups) || []
      armor_categories_params = params.delete(:armor_categories) || []

      search = klass.where(params)


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

      search
    end
  end
end
