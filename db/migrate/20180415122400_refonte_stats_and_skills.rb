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

    create_table :ability_bonus do |t|
      # HABTM Through
      t.belongs_to :character, index: true
      t.belongs_to :ability, index: true
      # Columns
      t.integer :total_value
      t.integer :initial_value
      t.integer :bonus_racial
      t.integer :bonus_klass
      t.integer :formation
      t.integer :level_4
      t.integer :level_8
      t.integer :bonus_parangon
      t.integer :level_14
      t.integer :level_18
      t.integer :bonus_epic
      t.integer :level_28
      t.integer :level_24
    end
  end

end
