class Language  < ActiveRecord::Base

  has_many :character_choices
  has_many :characters, through: :character_choices
end
