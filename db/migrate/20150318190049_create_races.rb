class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
