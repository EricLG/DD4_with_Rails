class CreateGroupeArmes < ActiveRecord::Migration
  def change
    create_table :groupe_armes do |t|
      t.string :nom

      t.timestamps
    end
  end
end
