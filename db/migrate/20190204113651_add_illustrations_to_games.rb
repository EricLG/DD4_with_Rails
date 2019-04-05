class AddIllustrationsToGames < ActiveRecord::Migration[4.2]
  def change
    add_column :games, :illustrations, :json
  end
end
