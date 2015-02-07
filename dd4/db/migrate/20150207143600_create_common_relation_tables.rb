class CreateCommonRelationTables < ActiveRecord::Migration
  def change
    create_table :common_weapons_weapon_groups do |t|

      t.belongs_to :common_weapon, index: true
      t.belongs_to :weapon_group, index: true
    end

    create_table :common_weapons_weapon_properties, id: false do |t|

      t.belongs_to :common_weapon, index: true
      t.belongs_to :weapon_property, index: true
    end
  end
end