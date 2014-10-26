class CreateCategorieArmes < ActiveRecord::Migration
  def change
    create_table :categorie_armes do |t|
      t.string :nom

      t.timestamps
    end
  end
end
