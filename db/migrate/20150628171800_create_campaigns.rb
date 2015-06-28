class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.references :game_master

      t.timestamps
    end

    create_table :games do |t|
      t.datetime :played
      t.text :description
      t.belongs_to :campaign

      t.timestamps
    end

    create_table :characters do |t|
      t.string  :char_name
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
      t.belongs_to :user
      t.belongs_to :klass
      t.belongs_to :race

      t.timestamps
    end


    create_table :campaigns_characters, id: false do |t|
      t.belongs_to :campaign, index: true
      t.belongs_to :character, index: true
    end
  end
end
