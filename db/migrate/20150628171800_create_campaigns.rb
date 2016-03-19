class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.references :game_master
      t.string :status

      t.timestamps
    end

    create_table :games do |t|
      t.datetime :played
      t.text :description
      t.belongs_to :campaign

      t.timestamps
    end

    create_table :characters do |t|
      t.string  :name
      t.integer :experience
      t.integer :level
      t.string  :parangon
      t.string  :epic
      t.integer :age
      t.string  :height
      t.string  :weight
      t.string  :alignment
      t.string  :divinity
      t.string  :party
      t.integer :status
      t.integer :initial_stat_id
      t.integer :level_4_id
      t.integer :level_8_id
      t.integer :level_11_id
      t.integer :level_14_id
      t.integer :level_18_id
      t.integer :level_21_id
      t.integer :level_24_id
      t.integer :level_28_id
      t.integer :race_stat_id
      t.belongs_to :user
      t.belongs_to :klass
      t.belongs_to :race

      t.timestamps
    end

  end
end
