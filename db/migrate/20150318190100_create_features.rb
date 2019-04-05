class CreateFeatures < ActiveRecord::Migration[4.2]
  def change
    create_table :features do |t|
      t.string :name
      t.string :kind # 'race' | 'klass'
      t.text :description
      t.string :required, default: "required"
      t.references :parent_feature, index: true

      t.timestamps
    end

    create_table :available_features, id: false do |t|
      t.belongs_to :feature, index: true
      t.belongs_to :klass, index: true
      t.belongs_to :race, index: true
    end
  end
end
