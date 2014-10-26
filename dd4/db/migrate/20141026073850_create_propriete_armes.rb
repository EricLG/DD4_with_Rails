class CreateProprieteArmes < ActiveRecord::Migration
  def change
    create_table :propriete_armes do |t|
      t.string :nom

      t.timestamps
    end
  end
end
