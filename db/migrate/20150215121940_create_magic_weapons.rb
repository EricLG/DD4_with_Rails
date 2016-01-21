class CreateMagicWeapons < ActiveRecord::Migration
  def change
    create_table :magic_weapons do |t|

      t.string :name, index: true
      t.string :description,  limit: 500
      t.string :alteration,   limit: 500
      t.string :critical,     limit: 500
      t.text :property
      t.text :power
      t.text :special
      t.integer :rarity
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :magic_weapons_weapon_groups, id: false do |t|

      t.belongs_to :magic_weapon, index: true
      t.belongs_to :weapon_group, index: true
    end

    create_table :magic_weapons_object_levels, id: false do |t|

      t.belongs_to :magic_weapon, index: true
      t.belongs_to :object_level, index: true
    end
  end
end
