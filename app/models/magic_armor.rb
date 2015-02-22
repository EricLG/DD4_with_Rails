class MagicArmor < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :alteration, presence: true
  validates :source, presence: true
  validates :armor_categories, :length => { :minimum => 1}
  validates :object_levels, :length => { :minimum => 1}
end
