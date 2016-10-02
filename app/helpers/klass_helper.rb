module KlassHelper

  def display_formations(klass)
    text = ''
    text += klass.required_skills.map(&:to_s_for_class).join(' ou ') + '<br>' unless klass.required_skills.empty?
    text += "Au niveau 1, choisissez #{klass.skills_number} formations de compétences supplémentaires dans la liste ci-dessous.<br>"
    text += "<em>Compétences de classe :</em> " + klass.available_skills.to_s_for_class
    return text
  end

  def display_weapons_handled(klass)
    text = ''
    text += klass.weapon_categories.map(&:name).join(', ') unless klass.weapon_categories.empty?
    text += klass.common_weapons.map(&:name).join(', ') unless klass.common_weapons.empty?
    result = klass.weapon_categories.map(&:name)
    result = result + klass.common_weapons.map(&:name)
    return result.join(', ')
    #return text
  end
end