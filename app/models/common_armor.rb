class CommonArmor < ApplicationRecord
  belongs_to :source
  belongs_to :armor_category

  scope :armors,  -> { joins(:armor_category).where.not(armor_categories: { code: %w[lightsh heavysh] }) }
  scope :shields, -> { joins(:armor_category).where(armor_categories: { code: %w[lightsh heavysh] }) }

  scope :select_category, -> { joins(:armor_category).select('common_armors.*, armor_categories.heavy as armor_category_heavy') }

  def category
    self.armor_category.name
  end

  def shield?
    self.armor_category.shield?
  end

  # Instance must have been founded with select_category scope
  def heavy?
    self.try(:armor_category_heavy) || false
  end
end
