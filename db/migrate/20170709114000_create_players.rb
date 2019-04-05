class CreatePlayers < ActiveRecord::Migration[4.2]

  def change
    create_table :players do |t|
      t.belongs_to :user, index: true
      t.belongs_to :campaign, index: true
      t.belongs_to :character, index: true

      t.timestamps
    end
  end
end
