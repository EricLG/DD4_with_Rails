class CreatePlayers < ActiveRecord::Migration

  def change
    create_table :players do |t|
      t.belongs_to :user, index: true
      t.belongs_to :campaign, index: true

      t.timestamps
    end
  end
end
