module CommentsHelper
  def character_logo(character)
    filename = File.join('avatar_heros', normalize_str(character.name) + '.jpg')
    unless File.exist?(File.join(Rails.root, 'app', 'assets', 'images', filename))
      filename = File.join('mini_icones', normalize_str(character.race.name) + '.jpg')
    end
    filename
  end
end
