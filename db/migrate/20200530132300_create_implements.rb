class CreateImplements < ActiveRecord::Migration[5.2]
  def change
    create_table :implement_properties do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :implements do |t|
      t.string :name
      t.boolean :superior
      t.string :weight
      t.string :price
      t.belongs_to :implement_group, index: true

      t.timestamps
    end

    # Join table for implement has_many implement_properties
    create_table :implement_properties_implements, id: false do |t|
      t.belongs_to :implement, index: true
      t.belongs_to :implement_property, index: true
    end

    add_column :characters, :main_implement_id, :integer, index: true
    add_column :characters, :second_implement_id, :integer, index: true
  end
end
