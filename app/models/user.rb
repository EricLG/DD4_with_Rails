class User < ActiveRecord::Base

  has_many :characters
  has_secure_password

  has_many :wishlists
  has_many :magic_items , through: :wishlists
end
