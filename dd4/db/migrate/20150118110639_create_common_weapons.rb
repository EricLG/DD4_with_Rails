class CreateCommonWeapons < ActiveRecord::Migration
  def change
    create_table :common_weapons do |t|

      # propriété commune
      t.string :name
      t.string :type # Arme, armure ou bouclier
      t.string :weight
      t.string :price
      t.string :damage
      t.string :handling # Maniement
      t.string :range
      t.boolean :two_handed # Vrai si manié à 2 mains


      t.timestamps
    end
  end
end
