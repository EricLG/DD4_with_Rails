class CreateObjectLevels < ActiveRecord::Migration[4.2]
  def change
    create_table :object_levels do |t|

      t.integer :level, index: true
      t.string  :price
      t.integer :alteration

      t.timestamps
    end
  end
end
