class CreateClassFeatures < ActiveRecord::Migration
  def change
    create_table :class_features do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
