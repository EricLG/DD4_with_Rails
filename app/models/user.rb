class User < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  has_many :wishlists, dependent: :delete_all
  has_many :players, dependent: :delete_all
  has_many :magic_items, through: :wishlists
  has_many :campaigns, through: :players
  has_many :games, through: :campaigns
  has_secure_password
end
