class CreateChoices < ActiveRecord::Migration[4.2]
  def change

    create_table :choices do |t|

      t.belongs_to :character, index: true
      t.belongs_to :feature, index: true
      t.belongs_to :language, index: true
      t.belongs_to :skill, index: true
    end
  end
end
