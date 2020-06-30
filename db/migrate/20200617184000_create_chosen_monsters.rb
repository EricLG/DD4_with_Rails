class CreateChosenMonsters < ActiveRecord::Migration[5.2]
  def change
    # Join table for encounters has_many_and_belongs_to monsters
    create_table :chosen_monsters do |t|
      t.belongs_to :encounter, index: true
      t.belongs_to :monster, index: true
      t.integer :quantity
    end
  end
end
