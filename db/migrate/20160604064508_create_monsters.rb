class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :main_role
      t.string :second_role
      t.boolean :leader
      t.integer :level
      t.string :category
      t.integer :px
      t.string :race
      t.string :origin
      t.string :keywords
      t.references :source, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
