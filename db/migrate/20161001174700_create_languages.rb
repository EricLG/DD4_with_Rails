class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.string :writing
      t.string :spoken_by
      t.text :description
      t.boolean :level_1

      t.timestamps
    end
  end
end
