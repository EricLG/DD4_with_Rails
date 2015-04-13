class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma

      t.timestamps
    end
  end
end
