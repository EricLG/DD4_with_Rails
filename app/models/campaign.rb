class Campaign < ActiveRecord::Base

  belongs_to :game_master, class_name: "User", foreign_key: "game_master_id"
  has_many :games
end
