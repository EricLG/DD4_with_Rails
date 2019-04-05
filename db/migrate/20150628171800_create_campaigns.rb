class CreateCampaigns < ActiveRecord::Migration[4.2]
  def change

    enable_extension :hstore

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
      t.string  :party
      t.integer :status
      t.hstore  :stats
      t.belongs_to :user
      t.belongs_to :klass
      t.belongs_to :race

      t.timestamps
    end

  end
end
