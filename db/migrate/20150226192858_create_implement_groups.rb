class CreateImplementGroups < ActiveRecord::Migration[4.2]
  def change
    create_table :implement_groups do |t|
      t.string :name
      t.string :code, index: true

      t.timestamps
    end
  end
end
