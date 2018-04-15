class RefonteStatsAndSkills < ActiveRecord::Migration

  def change

    # Remplacement de la relation race/stat par une colonne ability_bonuses
    add_column :races, :ability_bonuses, :string

    # Drop Stats et Skills
    drop_table :stats
    #drop_table :skills

  end

end
