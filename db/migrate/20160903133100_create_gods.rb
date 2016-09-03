class CreateGods < ActiveRecord::Migration
  def change
    create_table :gods do |t|
      t.string :name
      t.string :rank
      t.string :alignment
      t.string :description
      t.string :influence
      t.timestamps null: false
    end
    
    change_table :characters do |t|
      t.integer :god_id
    end
  end
end
