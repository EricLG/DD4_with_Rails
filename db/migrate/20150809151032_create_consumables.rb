class CreateConsumables < ActiveRecord::Migration
  def change
    add_column :object_levels, :cons_price, :string

    create_table :consumables do |t|
      t.string :name
      t.string :description
      t.string :kind
      t.string :alteration
      t.string :property
      t.string :power
      t.string :special
      t.integer :source_id

      t.timestamps null: false
    end

    create_table :consumables_object_levels, id: false do |t|

      t.belongs_to :consumable, index: true
      t.belongs_to :object_level, index: true
    end
  end
end
