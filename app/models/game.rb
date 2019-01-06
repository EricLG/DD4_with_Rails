class Game < ActiveRecord::Base
  belongs_to :campaign
  has_and_belongs_to_many :characters
  has_one :game_master, through: :campaign
  has_many :comments, dependent: :destroy

  def owned?(current_user)
    self.user == current_user
  end
end
