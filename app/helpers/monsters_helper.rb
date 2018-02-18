module MonstersHelper

  def custom_transliterate(source)
    return source.mb_chars.downcase.to_s.gsub(/[Ééêè]/, 'e').gsub(/[\s]/, '_').gsub(/[\î]/, 'i').gsub(/[âà]/, 'a').gsub(/[\ô]/, 'o').gsub(/[Œœ]/, 'oe').gsub(/['-]/, '_').gsub(/[,]/, '').gsub(/[ûù]/, 'u')
  end
end
