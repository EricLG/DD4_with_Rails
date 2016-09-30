class CreateFeaturesChoices < ActiveRecord::Migration
  def change

    create_table :features_choices do |t|

      t.belongs_to :character, index: true
      t.belongs_to :klass_feature, index: true
    end
  end
end
