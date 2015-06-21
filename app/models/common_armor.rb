class CommonArmor < ActiveRecord::Base

  belongs_to :source
  belongs_to :armor_category

  def category
    self.armor_category.name
  end
end
