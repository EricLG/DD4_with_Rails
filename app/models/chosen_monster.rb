class ChosenMonster < ApplicationRecord
  belongs_to :encounter
  belongs_to :monster
end
