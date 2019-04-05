class RemoveSkillFromChoice < ActiveRecord::Migration[4.2]
  def change
    remove_column :choices, :skill_id, :integer
  end
end
