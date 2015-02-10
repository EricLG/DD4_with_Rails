class CreateCommonArmors < ActiveRecord::Migration
  def change
    create_table :common_armors do |t|

      # Common properties
      t.string :name
      t.string :weight
      t.string :price
      # Armor properties
      t.string :armor_bonus
      t.boolean :heavy # Léger ou lourd
      t.string :min_alteration_bonus # Pour armure de maitre
      t.string :skill_malus
      t.string :ms_malus # Move speed malus
      t.string :special
      t.belongs_to :source, index: true
      t.belongs_to :armor_category, index: true

      t.timestamps
    end
  end
end
