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

  def count_total_skill_value(carac_half_level, racial_bonus, s, klass_formations_choices)
    total = carac_half_level + racial_bonus
    total += 5 if free_required_skill(s)
    total += klass_formations_choices.send(s) unless free_required_skill(s)
    total
  end
end
