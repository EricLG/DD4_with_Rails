class ArmorCategory < ApplicationRecord
  has_many :common_armors
  has_and_belongs_to_many :magic_items

  ARMORS_CODE  = %w[clothe leather skin chainmail scales harnois].freeze
  SHIELDS_CODE = %w[lightsh heavysh].freeze

  scope :armors,  -> { where.not(armor_categories: { code: SHIELDS_CODE }) }
  scope :shields, -> { where(armor_categories:     { code: SHIELDS_CODE }) }

  def self.find_armor_categories(categories, category)
    category.split(', ').collect { |armor| categories.find { |ac| ac.name == armor } }
  end

  def shield?
    SHIELDS_CODE.include?(self.code)
  end
end
