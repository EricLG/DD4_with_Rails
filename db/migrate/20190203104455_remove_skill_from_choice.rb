class RemoveSkillFromChoice < ActiveRecord::Migration
  def change
    remove_column :choices, :skill_id, :integer
  end
end
