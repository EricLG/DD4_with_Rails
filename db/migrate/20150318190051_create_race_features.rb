class CreateRaceFeatures < ActiveRecord::Migration
  def change
    create_table :race_features do |t|
      t.string :name
      t.text :description
      t.string :required, default: "required"
      t.references :parent_feature, index: true

      t.timestamps
    end

    create_table :race_features_races, id: false do |t|
      t.belongs_to :race_feature, index: true
      t.belongs_to :race, index: true
    end
  end
end
