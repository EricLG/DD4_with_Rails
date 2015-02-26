class CreateImplementGroups < ActiveRecord::Migration
  def change
    create_table :implement_groups do |t|
      t.string :name
      t.string :code, index: true

      t.timestamps
    end
  end
end
