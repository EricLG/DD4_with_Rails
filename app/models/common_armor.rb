class CommonArmor < ActiveRecord::Base
  belongs_to :source
  belongs_to :armor_category

  scope :armors,  -> { joins(:armor_category).where.not(armor_categories: { code: %w[lightsh heavysh] }) }
  scope :shields, -> { joins(:armor_category).where(armor_categories: { code: %w[lightsh heavysh] }) }

  def category
    self.armor_category.name
  end

  def shield?
    self.armor_category.shield?
  end
end
