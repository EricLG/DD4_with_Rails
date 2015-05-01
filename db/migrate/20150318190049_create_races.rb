class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :cat_size
      t.integer :speed
      t.string :vision
      t.string :language
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
