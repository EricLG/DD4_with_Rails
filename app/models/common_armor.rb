class CommonArmor < ActiveRecord::Base

  belongs_to :source
  belongs_to :armor_category

  scope :armors,  -> {joins(:armor_category).where.not(armor_categories: {code: ["lightsh", "heavysh"]}) }
  scope :shields, -> {joins(:armor_category).where(armor_categories: {code: ["lightsh", "heavysh"]}) }

  def category
    self.armor_category.name
  end

  def is_shield?
    self.armor_category.is_shield?
  end
end
