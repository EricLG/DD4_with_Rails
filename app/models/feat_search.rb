class FeatSearch
  include ActiveModel::Model


   FIELDS = %i(name prerequisited_klasses prerequisited_races source)
  attr_accessor(*FIELDS)

  attr_accessor :params, :category

  def initialize(params = nil, category = "heroic")
    super(params)
    @category = category
  end

  def build_search
    params = {}
    FIELDS.each do |p|
      v = send(p)
      params[p] = v if v && !v.blank?
    end

    if params.empty?
      Feat.where(category: category)
    else
      name_params     = params.delete(:name)
      source_params   = params.delete(:source)
      klasses_params  = params.delete(:prerequisited_klasses) || []
      races_params    = params.delete(:prerequisited_races)   || []

      search = Feat.where(category: category)
      if name_params
        search = search.where("feats.name ILIKE ?", "%#{name_params}%")
      end

      if source_params
        search = search.joins(:source).where(source: source_params)
      end

      unless klasses_params.reject(&:empty?).empty?
        search = search.joins(:prerequisited_klasses).where(klass: {id: klasses_params})
      end

      unless races_params.reject(&:empty?).empty?
        search = search.joins(:prerequisited_race_features).where(race: {id: races_params})
      end

      search
    end
  end
end
