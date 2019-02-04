class AddIllustrationsToGames < ActiveRecord::Migration
  def change
    add_column :games, :illustrations, :json
  end
end
