class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.string :name
      t.string :category
      t.text   :avantage
      t.string :errata
      t.string :prerequisited_power
      t.string :prerequisited_skill
      t.string :prerequisited_other
      t.references :top_feat
      t.belongs_to :source, index: true

      t.timestamps
    end

    create_table :pr_races_for_feat, id: false do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :race, index: true
    end

    create_table :pr_klasses_for_feat, id: false do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :klass, index: true
    end

    create_table :pr_features_for_feat, id: false do |t|
      t.belongs_to :feat, index: true
      t.belongs_to :feature, index: true
    end
  end
end
