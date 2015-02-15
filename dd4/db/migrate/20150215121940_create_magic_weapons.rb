class CreateMagicWeapons < ActiveRecord::Migration
  def change
    create_table :magic_weapons do |t|

      t.timestamps
    end
  end
end
