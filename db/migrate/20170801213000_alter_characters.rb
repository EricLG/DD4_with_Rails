class AlterCharacters < ActiveRecord::Migration

  def change
    add_column :characters, :formations_choice_id, :hstore
    add_index :characters, :formations_choice_id
  end
end
