class CreateObjetCommuns < ActiveRecord::Migration
  def change
    create_table :objet_communs do |t|

      # propriété commune
      t.string :nom
      t.string :type # Arme, armure ou bouclier
      t.string :poids
      t.string :prix
      # propriété des armes
      t.string :degats
      t.string :maniement
      t.string :portee
      t.boolean :deux_mains # Vrai si manié à 2 mains
      # propriété des armures et boucliers
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
