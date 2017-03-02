class MonsterSearch
  include ActiveModel::Model

  FIELDS = %i(name main_role second_role level category race origin keywords source leader)
  attr_accessor(*FIELDS)

  attr_accessor :params

  def initialize(params = nil)
    super(params)
  end

  def build_search()
    params = {}
    FIELDS.each do |p|
      v = send(p)
      params[p] = v if v && !v.blank?
    end

    search = Monster.includes(:source)

    unless params.empty?

      name_params           = params.delete(:name)
      main_role_params      = params.delete(:main_role)
      second_role_params    = params.delete(:second_role)
      level_params          = params.delete(:level)
      category_params       = params.delete(:category)
      race_params           = params.delete(:race)
      origin_params         = params.delete(:origin)
      keywords_params       = params.delete(:keywords)
      source_params         = params.delete(:source)
      leader_params         = params.delete(:leader)

      search = search.where(params)
      if name_params
        search = search.where("monsters.name ILIKE ?", "%#{name_params}%")
      end

      if level_params
        search = search.where("monsters.level = ?", level_params)
      end

      if main_role_params
        search = search.where(main_role: main_role_params)
      end
      if second_role_params
        search = search.where(second_role: second_role_params)
      end
      if category_params
        search = search.where(category: category_params)
      end
      if race_params
        search = search.where(race: race_params)
      end
      if origin_params
        search = search.where(origin: origin_params)
      end
      if keywords_params
        search = search.where(keywords: keywords_params)
      end

      if source_params
        search = search.joins(:source).where(source: source_params)
      end
      if leader_params
        search = search.where(leader: leader_params)
      end

    end
    search
  end

end
