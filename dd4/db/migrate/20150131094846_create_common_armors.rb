class CreateCommonArmors < ActiveRecord::Migration
  def change
    create_table :common_armors do |t|

      # Common properties
      t.string :name
      t.string :type # Arme, armure ou bouclier
      t.string :poids
      t.string :prix
      # Armor properties
      t.string :bonus_armure
      t.string :bonus_bouclier
      t.string :poids_categorie # Léger ou lourd
      t.string :bonus_min_alteration
      t.string :malus_test
      t.string :malus_vd
      t.string :special

      t.timestamps
    end
  end
end
