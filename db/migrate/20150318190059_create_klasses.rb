class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.string :power_source
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
