class CreateCharactersGames < ActiveRecord::Migration
  def change

    create_table :characters_games, id: false do |t|

      t.belongs_to :character, index: true
      t.belongs_to :game, index: true
    end
  end
end
