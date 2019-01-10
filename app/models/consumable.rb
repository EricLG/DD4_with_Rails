class Consumable < ActiveRecord::Base
  belongs_to :source
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :object_levels, length: { minimum: 1 }
  validates :source, presence: true
end
