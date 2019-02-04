class Game < ActiveRecord::Base
  mount_uploaders :illustrations, IllustrationUploader
  belongs_to :campaign
  has_and_belongs_to_many :characters
  has_one :game_master, through: :campaign
  has_many :comments, dependent: :destroy

  def game_master?(current_user)
    self.game_master == current_user
  end
end
