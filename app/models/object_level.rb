class ObjectLevel < ActiveRecord::Base
  def self.find_object_levels(object_levels, object_level)
    object_level.split(', ').collect { |ol| object_levels.find { |l| l.level == ol.to_i } }
  end
end
