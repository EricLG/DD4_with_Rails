class CreateWeaponProperties < ActiveRecord::Migration
  def change
    create_table :weapon_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
