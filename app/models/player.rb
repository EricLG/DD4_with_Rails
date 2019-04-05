class Player < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :character
end
