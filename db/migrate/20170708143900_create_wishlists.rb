class CreateWishlists < ActiveRecord::Migration[4.2]
  def change
    create_table :wishlists, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :magic_item, index: true
      t.belongs_to :character, index: true

      t.timestamps
    end
  end
end
