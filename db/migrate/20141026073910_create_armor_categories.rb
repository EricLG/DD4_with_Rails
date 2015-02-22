class CreateArmorCategories < ActiveRecord::Migration
  def change
    create_table :armor_categories do |t|
      t.string  :code, index: true
      t.string  :name
      t.boolean :heavy

      t.timestamps
    end
  end
end
