class Campaign < ApplicationRecord
  belongs_to :game_master, class_name: 'User', foreign_key: 'game_master_id'
  has_many :games
  has_many :players
  has_many :users, through: :players
  has_many :magic_items, through: :users
  has_many :characters, through: :players
  has_many :comments, dependent: :destroy

  def game_master?(user)
    game_master == user
  end
end
