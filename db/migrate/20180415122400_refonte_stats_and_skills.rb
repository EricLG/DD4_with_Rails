class RefonteStatsAndSkills < ActiveRecord::Migration

  def change

    # Remplacement de la relation race/stat par une colonne ability_bonuses
    add_column :races, :ability_bonuses, :string

    # Drop Stats et Skills
    drop_table :stats
    #drop_table :skills

    # Recréation des tables. Stat devient Ability
    create_table :abilities do |t|
      t.string  :name # strength, constitution, etc.
      t.string  :description
      t.timestamps
    end

    create_table :ability_bonuses do |t|
      # HABTM Through
      t.belongs_to :character, index: true
      t.belongs_to :ability, index: true
      # Columns
      t.integer :total_value, default: 0
      t.integer :initial_value, default: 0
      t.integer :bonus_racial, default: 0
      t.integer :bonus_klass, default: 0
      t.integer :level_4, default: 0
      t.integer :level_8, default: 0
      t.integer :level_11, default: 0
      t.integer :level_14, default: 0
      t.integer :level_18, default: 0
      t.integer :level_21, default: 0
      t.integer :level_24, default: 0
      t.integer :level_28, default: 0
      t.integer :bonus_parangon, default: 0
      t.integer :bonus_epic, default: 0
    end
  end

end
