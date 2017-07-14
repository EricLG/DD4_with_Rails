class User < ActiveRecord::Base

  has_many :characters

  has_many :wishlists
  has_many :magic_items , through: :wishlists
  has_many :players
  has_many :campaigns, through: :players

  has_secure_password
end
