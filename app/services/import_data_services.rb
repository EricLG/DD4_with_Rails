module ImportDataServices
  def self.import_all_informations
    {
      sources: Source.all,
      levels: ObjectLevel.all,
      groups: WeaponGroup.all,
      categories: ArmorCategory.all,
      implements: ImplementGroup.all,
      locations: Location.all
    }
  end

  def self.clear_field(field)
    field = field.strip
    field = field[1..-1] if field.first == '"'
    field = field[0...-2] if field.last(2) == '";'
    field = field[0...-1] if field.last == '"'
    field
  end

  def self.find_level_array(item, min, array_to_parse, levels)
    if item.gear?
      ImportDataServices.find_each_level(array_to_parse, levels)
    else
      ImportDataServices.calcul_level_array(min, levels)
    end
  end

  def self.calcul_level_array(min, levels)
    array = []
    while min < 31 && min > 0
      level = levels.find { |l| l.level == min }
      array << level
      min += 5
    end
    array
  end

  def self.find_each_level(str, levels)
    # "Niv.   5  +1           1 000 PO, Niv. 15  +3         25 000 PO, Niv. 25  +5       625 000 PO"
    result = []
    array_str = str.split(',')
    array_str.each do |s|
      current_level = s.strip.match(/Niv.\s*(\d{1,2}).*/).captures.first
      result << levels.find { |l| l.level == current_level.to_i }
    end
    result
  end

  def self.find_weapon_groups(data, groups)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      array << groups.find { |g| g.name == d.strip }
    end
    array
  end

  def self.find_armor_categories(data, categories)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      cat = categories.find { |c| c.name == d.strip }
      if !cat.nil?
        array << cat
      elsif d =~ /étoffe/
        array << categories.find { |c| c.code == 'clothe' }
      elsif d =~ /cuir/
        array << categories.find { |c| c.code == 'leather' }
      elsif d =~ /peau/
        array << categories.find { |c| c.code == 'skin' }
      elsif d =~ /écailles/
        array << categories.find { |c| c.code == 'scales' }
      elsif d =~ /Léger/
        array << categories.find { |c| c.code == 'lightsh' }
      elsif d =~ /Lourd/
        array << categories.find { |c| c.code == 'heavysh' }
      end
    end
    array
  end

  def self.find_implement_group(data, groups)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      array << groups.find { |g| g.name == d.strip }
    end
    array
  end

  def self.find_category(data)
    category = data == 'Parangonique' ? 'parangonic' : 'heroic'
    category
  end

  def self.find_features(data, features)
    finded_features = []
    array_data = data.split(', ')
    array_data.each do |d|
      if d == 'Dieux'
        finded_features << features.find { |f| f.name == 'Conduit divin' }
      elsif !d.blank?
        founded_feat = features.find { |f| f.name == d }
        finded_features << founded_feat unless founded_feat.nil?
      end
    end
    finded_features
  end

  def self.clear_array_line(line)
    array_line = []
    line.each do |field|
      array_line << ImportDataServices.clear_field(field)
    end
    array_line
  end

  def self.find_klass_or_race(data, all_collec)
    result = []
    unless data.empty?
      d = data.split(',', -1).map(&:strip)
      result = all_collec.where(name: d)
    end
    result
  end

  def self.find_rarities(integer)
    rarity = case integer.to_i
             when 1
               'common'
             when 2
               'uncommon'
             when 3
               'rare'
             else
               'common'
             end
    rarity
  end
end
