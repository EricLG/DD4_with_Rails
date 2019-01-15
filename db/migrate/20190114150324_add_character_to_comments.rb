class AddCharacterToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :character, foreign_key: true
  end
end
