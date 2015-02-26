class CreateMagicImplements < ActiveRecord::Migration
  def change
    create_table :magic_implements do |t|
      t.string :name
      t.string :description,     limit: 500
      t.string :alteration,      limit: 500
      t.text :property
      t.string :critical
      t.string :string
      t.text :power
      t.text :special
      t.belongs_to :source_id

      t.timestamps
    end

    create_table :implement_groups_magic_implements, id: false do |t|

      t.belongs_to :implement_group, index: true
      t.belongs_to :magic_implement, index: true
    end

    create_table :magic_implements_object_levels, id: false do |t|

      t.belongs_to :magic_implement, index: true
      t.belongs_to :object_level, index: true
    end
  end
end
