class CreateChoices < ActiveRecord::Migration
  def change

    create_table :choices do |t|

      t.belongs_to :character, index: true
      t.belongs_to :feature, index: true
      t.belongs_to :language, index: true
    end
  end
end
