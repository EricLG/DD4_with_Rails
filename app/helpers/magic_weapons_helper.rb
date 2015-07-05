module MagicWeaponsHelper

  def display_weapon_group(groups)
    if groups.size == 14
      return "Toutes"
    elsif groups.map(&:name) - ["Arbalètes", "Arcs", "Frondes", "Haches", "Lames légères", "Lances", "Marteaux"] == []
      return "Distances"
    elsif groups.map(&:name) - ["Armes d'hast", "Bâtons", "Fléaux", "Haches", "Lames légères", "Lames lourdes", "Lances", "Mains nues", "Marteaux", "Masses", "Pics"] == []
      return "Corps à corps"
    elsif groups.empty?
      return "Aucun groupe"
    else
      return simple_format groups.map(&:name).join("\n")
    end
  end

end
