module MagicItemsHelper

  def display_weapon_group(groups)
    if groups.empty?
      return ""
    elsif groups.size == 14
      return "Toutes"
    elsif groups.map(&:name).sort == ["Arbalètes", "Arcs", "Frondes", "Haches", "Lames légères", "Lances", "Marteaux"]
      return "Distances"
    elsif groups.map(&:name).sort == ["Armes d'hast", "Bâtons", "Fléaux", "Haches", "Lames lourdes", "Lames légères", "Lances", "Mains nues", "Marteaux", "Masses", "Pics"]
      return "Corps à corps"
    else
      return simple_format(groups.map(&:name).sort.join("\n"), {}, {wrapper_tag: 'span'})
    end
  end

  def find_correct_url(kind)
    if kind == 'weapons'
      return weapons_items_magic_items_path
    elsif kind == 'armors'
      return armors_items_magic_items_path
    elsif kind == 'implements'
      return implements_items_magic_items_path
    elsif kind == 'gears'
      return gears_items_magic_items_path
    elsif kind == 'amulets'
      return amulets_items_magic_items_path
    end
  end

  def display_progress_bar(label, items_number, max_item, popover = {})
    html = content_tag(:p, label)
    width = (items_number.to_f/max_item.to_f*100).to_s + '%;'
    pb = content_tag(:div, "#{items_number}/#{max_item}", class: "progress-bar", style: "min-width: 4%; width: #{width}", role:"progress-bar")
    html += content_tag(:div, pb, class:"progress")
    unless popover.empty?
      html = content_tag(:div, html, class: "gears", :data => {html: true, placement: 'top', toggle: 'popover', trigger: 'hover', content: popover[:content], title: popover[:title]})
    end
    return content_tag(:div, html)
  end

end
