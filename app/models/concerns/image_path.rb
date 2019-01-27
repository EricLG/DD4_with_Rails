module ImagePath
  extend ActiveSupport::Concern

  def normalize_str
    name.mb_chars.downcase.tr(' ', '_').parameterize
  end
end
