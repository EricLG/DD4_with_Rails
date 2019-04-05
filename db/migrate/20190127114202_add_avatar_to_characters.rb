class AddAvatarToCharacters < ActiveRecord::Migration[4.2]
  def change
    add_column :characters, :avatar, :string
  end
end
