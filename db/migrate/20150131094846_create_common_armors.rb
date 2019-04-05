class CreateCommonArmors < ActiveRecord::Migration[4.2]
  def change
    create_table :common_armors do |t|

      # Common properties
      t.string :name
      t.string :weight
      t.string :price
      # Armor properties
      t.integer :armor_bonus
      t.integer :min_alteration_bonus # Pour armure de maitre
      t.integer :skill_malus
      t.integer :ms_malus # Move speed malus
      t.string :special
      t.belongs_to :source, index: true
      t.belongs_to :armor_category, index: true

      t.timestamps
    end
  end
end
