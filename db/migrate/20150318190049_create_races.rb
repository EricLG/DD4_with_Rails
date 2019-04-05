class CreateRaces < ActiveRecord::Migration[4.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :average_height
      t.string :average_weight
      t.string :cat_size
      t.integer :speed
      t.string :vision
      t.string :language
      t.integer :nb_language_sup, default: 0
      t.text  :information
      t.belongs_to :skill
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
