class UpdateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.belongs_to :character, index: true
      t.belongs_to :magic_item, index: true
      t.belongs_to :location, index: true
      t.integer :level
    end

    add_column :characters, :main_weapon_id, :integer, index: true
    add_reference :characters, :second_hand, polymorphic: true
    add_column :characters, :armor_id, :integer, index: true
    add_column :characters, :roleplay, :text
  end
end
