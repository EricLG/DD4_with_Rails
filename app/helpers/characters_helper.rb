module CharactersHelper
  include KlassHelper

  def count_total_skill_value(carac_half_level, racial_bonus, s, klass_formations_choices)
    total = carac_half_level + racial_bonus
    total += 5 if free_required_skill(s)
    total += klass_formations_choices.send(s) unless free_required_skill(s)
    total
  end
end
