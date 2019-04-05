class AddFeatsToCharacters < ActiveRecord::Migration[4.2]
  def change
    create_table :chosen_feats do |t|
      # HABTM Through
      t.belongs_to :character, index: true
      t.belongs_to :feat, index: true
      # Columns
      t.string :information
      t.boolean :free, default: false
      t.belongs_to :weapon_group, index: true
      t.belongs_to :proficiency, index: true
      t.belongs_to :implement_group, index: true
      t.belongs_to :ability, index: true
      t.belongs_to :skill, index: true
    end

    create_table :chosen_feats_languages, id: false do |t|
      t.belongs_to :chosen_feat, index: true
      t.belongs_to :language, index: true
    end
  end
end
