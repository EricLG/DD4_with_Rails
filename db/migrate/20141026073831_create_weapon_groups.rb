class CreateWeaponGroups < ActiveRecord::Migration
  def change
    create_table :weapon_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
