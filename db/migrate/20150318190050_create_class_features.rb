class CreateClassFeatures < ActiveRecord::Migration
  def change
    create_table :class_features do |t|
      t.string :name
      t.text :description
      t.belongs_to :klass

      t.timestamps
    end
  end
end
