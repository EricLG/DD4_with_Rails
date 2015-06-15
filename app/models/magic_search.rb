class MagicSearch
  include ActiveModel::Model


   FIELDS = %i(name weapon_groups object_levels source)
  attr_accessor(*FIELDS)

  attr_accessor :params

  def initialize(params = nil)
    super(params)
  end

  def build_search
    params = {}
    FIELDS.each do |p|
      v = send(p)
      params[p] = v if v && !v.blank?
    end

    if params.empty?
      MagicWeapon.all
    else
      name_params           = params.delete(:name)
      weapon_groups_params  = params.delete(:weapon_groups).reject(&:empty?)
      object_levels_params  = params.delete(:object_levels)
      source_params         = params.delete(:source)

      search = MagicWeapon.where(params)


      if name_params
        search = search.where("name ILIKE ?", "%#{name_params}%")
      end

      if !weapon_groups_params.empty?
        search = search.joins(:weapon_groups).where(weapon_groups: {id: weapon_groups_params})
      end

      if object_levels_params
        search = search.joins(:object_levels).where("object_levels.level <= ?", object_levels_params)
      end

      if source_params
        search = search.joins(:source).where(source: source_params)
      end

      search
    end
  end
end
