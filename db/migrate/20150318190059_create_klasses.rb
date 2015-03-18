class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.string :power_source
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :class_features_klasses do |t|

      t.belongs_to :class_feature, index: true
      t.belongs_to :klass, index: true
    end
  end

end
