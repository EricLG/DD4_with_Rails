module MagicItemsHelper
  def display_weapon_group(groups)
    if groups.empty?
      ''
    elsif groups.size == 14
      'Toutes'
    elsif groups.map(&:name).sort == ['Arbalètes', 'Arcs', 'Frondes', 'Haches', 'Lames légères', 'Lances', 'Marteaux']
      'Distances'
    elsif groups.map(&:name).sort == ["Armes d'hast", 'Bâtons', 'Fléaux', 'Haches', 'Lames lourdes', 'Lames légères', 'Lances', 'Mains nues', 'Marteaux', 'Masses', 'Pics']
      'Corps à corps'
    else
      simple_format(groups.map(&:name).sort.join("\n"), {}, wrapper_tag: 'span')
    end
  end

  def find_correct_url(kind)
    if kind == 'weapons'
      weapons_items_magic_items_path
    elsif kind == 'armors'
      armors_items_magic_items_path
    elsif kind == 'implements'
      implements_items_magic_items_path
    elsif kind == 'gears'
      gears_items_magic_items_path
    elsif kind == 'amulets'
      amulets_items_magic_items_path
    end
  end

  def display_progress_bar(label, items_number, max_item, popover = {})
    html = content_tag(:p, label)
    width = (items_number.to_f / max_item.to_f * 100).to_s + '%;'
    pb = content_tag(:div, "#{items_number}/#{max_item}", class: 'progress-bar', style: "min-width: 4%; width: #{width}", role: 'progress-bar')
    html += content_tag(:div, pb, class: 'progress')
    unless popover.empty?
      options_hash = {
        html: true, placement: 'top',
        toggle: 'popover',
        trigger: 'hover',
        content: popover[:content],
        title: popover[:title]
      }
      html = content_tag(:div, html, class: 'gears', data: options_hash)
    end
    content_tag(:div, html)
  end

  def options_for_select_with_enum(klass, enum, selected = nil)
    options = []
    enum.keys.each do |enum_key|
      options << [klass.human_attribute_name(enum_key), enum_key]
    end
    options_for_select(options, selected)
  end
end
