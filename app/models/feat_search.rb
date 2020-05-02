class FeatSearch
  include ActiveModel::Model

  FIELDS = %i[category name prerequisited_klasses prerequisited_races source].freeze
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

    search = Feat.all.includes(:source)
    return search if params.empty?

    category_params = params.delete(:category)
    name_params     = params.delete(:name)
    source_params   = params.delete(:source)
    klasses_params  = params.delete(:prerequisited_klasses)
    races_params    = params.delete(:prerequisited_races)

    search = search.where(category: category_params) if category_params
    search = search.where('feats.name ILIKE ? or avantage ILIKE ?', "%#{name_params}%", "%#{name_params}%") if name_params
    search = search.joins(:source).where(source: source_params) if source_params
    # search = search.joins(:prerequisited_klasses).where(klasses: {id: klasses_params}) if klasses_params
    search = search.feats_for_klass_and_every_klasses(klasses_params) if klasses_params
    # search = search.joins(:prerequisited_races).where(races: {id: races_params}) if races_params
    search = search.feats_for_race_and_every_races(races_params) if races_params
    # On n'affiche pas les talents de conduit divins ou spécifique à un univers (RO, Eberron)
    search.no_divine_channel.no_ro.no_eberron
  end
end
