class RefonteStatsAndSkills < ActiveRecord::Migration[4.2]

  def change

    # Remplacement de la relation race/stat par une colonne ability_bonuses
    add_column :races, :ability_bonuses, :string

    # Drop Stats
    drop_table :stats

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

    # Drop des tables obsolètes
    drop_table :skills
    drop_table :available_skills_for_klass
    drop_table :required_skills_for_klass

    # Remplacement des colonnes liées aux Skills
    remove_column :races, :skill_id
    add_column :races, :skill_bonuses, :string
    add_column :klasses, :required_skills, :string
    add_column :klasses, :trained_skills, :string

    # Recréation des tables
    create_table :skills do |t|
      t.string  :name # acrobatics, arcana, athletics, etc.
      t.string  :description
      t.timestamps
    end

    create_table :skill_bonuses do |t|
      # HABTM Through
      t.belongs_to :character, index: true
      t.belongs_to :skill, index: true
      t.belongs_to :ability_bonus, index: true
      # Columns
      t.integer :armor, default: 0
      t.integer :alteration, default: 0
      t.integer :feat, default: 0
      t.integer :item, default: 0
      t.integer :klasse, default: 0
      t.integer :power, default: 0
      t.integer :proficiency, default: 0
      t.integer :shield, default: 0
      t.integer :racial, default: 0
      t.integer :training, default: 0
      t.timestamps
    end
  end

end
