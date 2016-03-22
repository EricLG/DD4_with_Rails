class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string  :name
      t.string  :role
      t.string  :power_source
      t.string  :main_stats
      t.string  :defense_bonus
      t.integer :base_hp
      t.integer :hp_per_level
      t.integer :healing_surge
      t.integer :skills_number
      t.string  :options_creation
      t.text    :information
      t.belongs_to :available_skills
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :armor_categories_klasses, id: false do |t|
      t.belongs_to :armor_category, index: true
      t.belongs_to :klass, index: true
    end

    create_table :common_weapons_klasses, id: false do |t|
      t.belongs_to :common_weapon, index: true
      t.belongs_to :klass, index: true
    end

    create_table :klasses_weapon_categories, id: false do |t|
      t.belongs_to :weapon_category, index: true
      t.belongs_to :klass, index: true
    end

    create_table :implement_groups_klasses, id: false do |t|
      t.belongs_to :implement_group, index: true
      t.belongs_to :klass, index: true
    end

    create_table :available_skills_for_klass, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :klass, index: true
    end

    create_table :required_skills_for_klass, id: false do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :klass, index: true
    end
  end
end
