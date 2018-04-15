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
      search = Feat.where(category: category)
    else
      name_params     = params.delete(:name)
      source_params   = params.delete(:source)
      klasses_params  = params.delete(:prerequisited_klasses)
      races_params    = params.delete(:prerequisited_races)

      search = Feat.where(category: category)
      if name_params
        search = search.where("feats.name ILIKE ? or avantage ILIKE ?", "%#{name_params}%", "%#{name_params}%")
      end

      if source_params
        search = search.joins(:source).where(source: source_params)
      end

      if klasses_params
        #search = search.joins(:prerequisited_klasses).where(klasses: {id: klasses_params})
        search = search.feats_for_klass_and_every_klasses(klasses_params)
      end

      if races_params
        #search = search.joins(:prerequisited_races).where(races: {id: races_params})
        search = search.feats_for_race_and_every_races(races_params)
      end

    end

    # On n'affiche pas les talents de conduit divins ou spécifique à un univers (RO, Eberron)
    search = search.no_divine_channel.no_ro.no_eberron
  end
end
