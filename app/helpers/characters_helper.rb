module CharactersHelper

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

  def count_total_bonus_comp(carac, racial)
    carac + racial
  end
end
