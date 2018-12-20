class Language < ActiveRecord::Base
  has_many :choices, inverse_of: :languages
  has_many :characters, through: :choices
end
