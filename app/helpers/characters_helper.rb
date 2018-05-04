module CharactersHelper
  include KlassHelper

  def pretty_modifier(modifier)
    if modifier > 0
      modifier = "+#{modifier}"
    end
    modifier
  end

end
