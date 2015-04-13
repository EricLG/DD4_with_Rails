class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.string :name
      t.string :category
      t.string :stat
      t.text :avantage
      t.string :errata
      t.belongs_to :stat, index: true
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :feats_races do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :race, index: true
    end
    create_table :feats_klasses do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :klass, index: true
    end
    create_table :class_features_feats do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :class_feature, index: true
    end
  end
end
