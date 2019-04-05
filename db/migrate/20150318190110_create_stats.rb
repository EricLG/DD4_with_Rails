class CreateStats < ActiveRecord::Migration[4.2]
  def change
    create_table :stats do |t|
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.string  :kind
      t.belongs_to :race
      t.references :pr_for_feat, index: true

      t.timestamps
    end

    create_table :skills do |t|
      t.integer :acrobatics    , default:0 # Acrobaties
      t.integer :arcana        , default:0 # Arcanes
      t.integer :athletics     , default:0 # Athlétisme
      t.integer :bluff         , default:0 # Bluff
      t.integer :diplomacy     , default:0 # Diplomatie
      t.integer :dungeoneering , default:0 # Exploration
      t.integer :endurance     , default:0 # Endurance
      t.integer :heal          , default:0 # Soins
      t.integer :history       , default:0 # Histoire
      t.integer :insight       , default:0 # Intuition
      t.integer :intimidate    , default:0 # Intimidation
      t.integer :nature        , default:0 # Nature
      t.integer :perception    , default:0 # Perception
      t.integer :religion      , default:0 # Religion
      t.integer :stealth       , default:0 # Discrétion
      t.integer :streetwise    , default:0 # Connais. de la rue
      t.integer :thievery      , default:0 # Larcin
      t.string  :origin
      t.timestamps
    end
  end
end
