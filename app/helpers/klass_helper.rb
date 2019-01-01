module KlassHelper
  def display_training(klass)
    text = ''
    text += klass.resume_skill_bonus_list(klass.required_skills).join(' ou ') + '<br>' unless klass.required_skills.empty?
    text += "Au niveau 1, choisissez #{klass.skills_number} formations de compétences supplémentaires dans la liste ci-dessous.<br>"
    text += '<em>Compétences de classe :</em> ' + klass.resume_skill_bonus_list(klass.trained_skills).join(', ')
    text
  end

  def display_weapons_handled(klass)
    result = klass.weapon_categories.map(&:name)
    result += klass.common_weapons.map(&:name)
    result.join(', ')
  end

  # Renvoie true si la compétence skill_name est obligatoire.
  def free_required_skill(skill_name)
    @character.klass.only_one_required_skill? && @character.klass.required_skills_to_a.include?(skill_name)
  end
end
