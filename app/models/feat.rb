class Feat < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :races
  has_and_belongs_to_many :klasses

  CATEGORY = %w(heroique parangonique epique)
end
