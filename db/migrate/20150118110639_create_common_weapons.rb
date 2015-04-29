class CreateCommonWeapons < ActiveRecord::Migration
  def change
    create_table :common_weapons do |t|

      # Common properties
      t.string :name
      t.string :weight
      t.string :price
      # Armor properties
      t.string :damage
      t.string :handling # Maniement
      t.string :range
      t.boolean :two_handed # Vrai si manié à 2 mains
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
