module CharactersHelper
  include KlassHelper

  def default_bonus_level
    if @character.level < 11
      bonus = 0
    elsif @character.level > 21
      bonus = 2
    else
      bonus = 1
    end
  end

  # Compte le bonus de caractérisque + le 1/2 niveau en fonction du personnage et de la compétence
  def count_carac_bonus_plus_half_level(character, skill)
    carac = character.total_stat(Skill.get_linked_carac(skill))
    bonus = (character.level / 2) + ((carac-10)/2)
    bonus.floor
  end

  def show_formation_bonus_rule(character)
    feature = nil
    if character.race.grant_dynamic_formation_skill?
      feature = character.race.features.main_ft.find do |f|
        f.name == "Compétence supplémentaire" || f.name == "Éducation éladrine"
      end
    end
    feature
  end

  def count_total_skill_value(carac_half_level, racial_bonus, s, klass_formations_choices)
    total = carac_half_level + racial_bonus
    total += 5 if free_required_skill(s)
    total += klass_formations_choices.send(s) unless free_required_skill(s)
    total
  end
end
