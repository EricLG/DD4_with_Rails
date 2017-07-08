class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :magic_item, index: true

      t.timestamps
    end
  end
end
