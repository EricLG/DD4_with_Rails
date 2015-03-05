class CreateMagicGears < ActiveRecord::Migration
  def change
    create_table :magic_gears do |t|
      t.string :name
      t.string :description,     limit: 500
      t.string :alteration,     limit: 500
      t.text :property
      t.text :power
      t.text :special
      t.belongs_to :location
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :armor_categories_magic_gears, id: false do |t|

      t.belongs_to :magic_gear, index: true
      t.belongs_to :armor_category, index: true
    end

    create_table :magic_gears_object_levels, id: false do |t|

      t.belongs_to :magic_gear, index: true
      t.belongs_to :object_level, index: true
    end
  end
end
