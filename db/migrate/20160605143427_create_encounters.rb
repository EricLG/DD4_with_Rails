class CreateEncounters < ActiveRecord::Migration[4.2]
  def change
    create_table :encounters do |t|
      t.integer :level
      t.integer :experience
      t.string :description
      t.references :source, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
