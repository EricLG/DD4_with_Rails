module ImportData

  def self.clear_field(field)
    field = field.strip
    if field.first == '"'
      field = field[1..-1]
    end
    if field.last == '"'
      field = field[0...-1]
    end
    field
  end

  def self.calcul_level_array(min, levels)
    array = []
    while min < 31 && min > 0
      level = levels.find{|l| l.level == min}
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
      result << levels.find{|l| l.level == current_level.to_i}
    end
    result
  end

  def self.find_weapon_groups(data, groups)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      array << groups.find{|g| g.name == d.strip}
    end
    array
  end

  def self.find_armor_categories(data, categories)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      cat = categories.find {|c| c.name == d.strip}
      if !cat.nil?
        array << cat
      elsif d.match(/étoffe/)
        array << categories.find{|c| c.code == 'clothe'}
      elsif d.match(/cuir/)
        array << categories.find{|c| c.code == 'leather'}
      elsif d.match(/peau/)
        array << categories.find{|c| c.code == 'skin'}
      elsif d.match(/écailles/)
        array << categories.find{|c| c.code == 'scales'}
      end
     end
    array
  end

  def self.find_implement_group(data, groups)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      array << groups.find{|g| g.name == d.strip}
    end
    array
  end

end
