class AlterCharacter < ActiveRecord::Migration

  def change
    add_column :characters, :formations_choice_id, :integer
    add_index :characters, :formations_choice_id
  end
end
