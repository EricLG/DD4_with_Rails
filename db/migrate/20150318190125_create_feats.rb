class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.string :name
      t.string :categorie
      t.string :stat
      t.string :prerequisite
      t.text :avantage
      t.string :errata
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
