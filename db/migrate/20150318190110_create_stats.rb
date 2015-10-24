class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.string  :kind
      t.references :pr_for_feat, index: true

      t.timestamps
    end

    create_table :skills do |t|
      t.integer :acrobatics     # Acrobaties
      t.integer :arcana         # Arcanes
      t.integer :athletics      # Athlétisme
      t.integer :bluff          # Bluff
      t.integer :diplomacy      # Diplomatie
      t.integer :dungeoneering  # Exploration
      t.integer :endurance      # Endurance
      t.integer :heal           # Soins
      t.integer :history        # Histoire
      t.integer :insight        # Intuition
      t.integer :intimidate     # Intimidation
      t.integer :nature         # Nature
      t.integer :perception     # Perception
      t.integer :religion       # Religion
      t.integer :stealth        # Discrétion
      t.integer :streetwise     # Connais. de la rue
      t.integer :thievery       # Larcin

      t.timestamps
    end
  end
end
