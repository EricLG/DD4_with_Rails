class CreateKlassFeatures < ActiveRecord::Migration
  def change
    create_table :klass_features do |t|
      t.string :name
      t.text :description
      t.string :required
      t.references :parent_feature, index: true

      t.timestamps
    end

    create_table :klass_features_klasses, id: false do |t|
      t.belongs_to :klass_feature, index: true
      t.belongs_to :klass, index: true
    end
  end
end
