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

  def count_comp_bonus_carac_level(competence, link_carac)
    level_bonus = (@character.level / 2)
    carac = @character.total_stat(link_carac)
    comp_bonus = level_bonus + ((carac-10)/2)
    comp_bonus.floor
  end

  def show_formation_bonus_rule(character)
    feature = nil
    if character.race.grant_dynamic_formation_skill?
      feature = character.race.features.main_ft.find do |feature|
        feature.name == "Compétence supplémentaire" || feature.name == "Éducation éladrine"
      end
    end
    feature
  end

  def count_total_skill_value(carac_half_level, racial_bonus, s)
    total = carac_half_level + racial_bonus
    total += 5 if free_required_skill(s)
    total += @klass_formations_choices.send(s) unless free_required_skill(s)
    total
  end
end
