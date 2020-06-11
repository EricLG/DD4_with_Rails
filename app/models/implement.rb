class Implement < ApplicationRecord
  has_and_belongs_to_many :implement_properties
  belongs_to :implement_group

  scope :join_implement_group_name, -> { joins(:implement_group).select('implement_groups.name as ig_name') }
end
