module MagicItemsHelper

  def display_weapon_group(groups)
    if groups.empty?
      return ""
    elsif groups.size == 14
      return "Toutes"
    elsif groups.map(&:name) - ["Arbalètes", "Arcs", "Frondes", "Haches", "Lames légères", "Lances", "Marteaux"] == []
      return "Distances"
    elsif groups.map(&:name) - ["Armes d'hast", "Bâtons", "Fléaux", "Haches", "Lames légères", "Lames lourdes", "Lances", "Mains nues", "Marteaux", "Masses", "Pics"] == []
      return "Corps à corps"
    else
      return simple_format groups.map(&:name).join("\n")
    end
  end

  def find_correct_url(kind)
    if kind == 'weapons'
      return weapons_object_magic_items_path
    elsif kind == 'armors'
      return armors_object_magic_items_path
    elsif kind == 'implements'
      return implements_object_magic_items_path
    elsif kind == 'gears'
      return gears_object_magic_items_path
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
