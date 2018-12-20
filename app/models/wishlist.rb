class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :magic_item
  belongs_to :character
end
