module CharactersHelper
  include KlassHelper

  def pretty_modifier(modifier)
    modifier = "+#{modifier}" if modifier > 0
    modifier
  end
end
