class CreateWeaponCategories <ActiveRecord::Migration
  def change
    create_table :weapon_categories do |t|
      t.string :code, index: true
      t.string :name
      t.boolean :ranged

      t.timestamps
    end
  end
end
