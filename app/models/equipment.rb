class Equipment < ApplicationRecord
  belongs_to :character
  belongs_to :equipped_magic_item, foreign_key: :magic_item_id, class_name: 'MagicItem'
  belongs_to :location
end
