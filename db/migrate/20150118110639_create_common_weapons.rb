class CreateCommonWeapons < ActiveRecord::Migration
  def change
    create_table :common_weapons do |t|

      # Common properties
      t.string :name
      t.string :weight
      t.string :price
      # Weapon properties
      t.string :damage
      t.string :handling # Maniement
      t.string :range
      t.integer :two_handed # enum : arme à 1 ou 2 mains ou double
      t.belongs_to :source, index: true
      t.belongs_to :weapon_category, index: true

      t.timestamps
    end

    create_table :common_weapons_weapon_groups, id: false do |t|

      t.belongs_to :common_weapon, index: true
      t.belongs_to :weapon_group, index: true
    end

    create_table :common_weapons_weapon_properties, id: false do |t|

      t.belongs_to :common_weapon, index: true
      t.belongs_to :weapon_property, index: true
    end
  end
end
