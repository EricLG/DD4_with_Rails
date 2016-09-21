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
end
