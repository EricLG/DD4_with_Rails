class Game < ActiveRecord::Base

  belongs_to :campaign
  has_many :characters

end
