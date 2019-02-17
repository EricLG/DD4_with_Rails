module CharactersHelper
  include KlassHelper

  def pretty_modifier(modifier)
    modifier = "+#{modifier}" if modifier > 0
    modifier
  end

  def modifier(value)
    (value / 2 - 5).floor
  end

  def total_defense(ability_bonus, half_level)
    10 + half_level + ability_bonus.modifier + ability_bonus.bonus_racial + ability_bonus.bonus_klass
  end

  def total_skill_value(skill, half_level)
    modifier(skill.ability_bonus_value) + half_level + skill.racial + skill.training
  end

  # https://getbootstrap.com/docs/3.4/javascript/#tooltips-options
  def tooltip(title, description, options = { placement: 'top', trigger: 'hover' }, &block)
    description = description.blank? ? 'Pas de description' : description
    html_tooltip = "<span
                    data-toggle=\"popover\"
                    data-html=\"true\"
                    data-placement=\"#{options[:placement]}\"
                    data-trigger=\"#{options[:trigger]}\"
                    data-content=\"#{simple_format description}\"
                    data-title=\"#{title}\" >
                      #{capture(&block)}
                    </span>"
    html_tooltip.html_safe
  end
end
