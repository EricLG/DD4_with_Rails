class CreateClassFeatures < ActiveRecord::Migration
  def change
    create_table :class_features do |t|
      t.string :name
      t.text :description
      t.references :top_feature, index: true

      t.timestamps
    end
  end
end
