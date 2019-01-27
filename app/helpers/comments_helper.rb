module CommentsHelper
  def character_logo(character)
    character.avatar? ? character.avatar_url : File.join('mini_icones', normalize_str(character.race.name) + '.jpg')
  end
end
