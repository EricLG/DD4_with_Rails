class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :texte
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
