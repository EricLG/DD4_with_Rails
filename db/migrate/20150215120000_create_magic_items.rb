class CreateMagicItems < ActiveRecord::Migration
  def change
    create_table :magic_items do |t|

      # Common attributes
      t.string :name, index: true
      t.string :description,  limit: 500
      t.string :alteration,   limit: 500
      t.text :property
      t.text :power
      t.text :special
      t.belongs_to :source, index: true
      t.integer :rarity

      # Weapon and Implement
      t.string :critical,     limit: 500
      # Gear
      t.belongs_to :location

      t.timestamps
    end

    create_table :magic_items_weapon_groups, id: false do |t|

      t.belongs_to :magic_item, index: true
      t.belongs_to :weapon_group, index: true
    end

    create_table :armor_categories_magic_items, id: false do |t|

      t.belongs_to :magic_item, index: true
      t.belongs_to :armor_category, index: true
    end

    create_table :implement_groups_magic_items, id: false do |t|

      t.belongs_to :magic_item, index: true
      t.belongs_to :implement_group, index: true
    end

    create_table :magic_items_object_levels, id: false do |t|

      t.belongs_to :magic_item, index: true
      t.belongs_to :object_level, index: true
    end

  end
end
