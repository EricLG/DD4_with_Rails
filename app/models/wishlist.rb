class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :magic_item
  belongs_to :character
end
