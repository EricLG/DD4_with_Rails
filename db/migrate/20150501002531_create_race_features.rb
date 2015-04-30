class CreateRaceFeatures < ActiveRecord::Migration
  def change
    create_table :race_features do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :pr_race_features_for_feat, id: false do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :race_feature, index: true
    end
  end
end
