class ObjectLevel < ApplicationRecord
  scope :level_min, -> { map(&:level).try(:min) }

  def self.find_object_levels(object_levels, object_level)
    object_level.split(', ').collect { |ol| object_levels.find { |l| l.level == ol.to_i } }
  end
end
