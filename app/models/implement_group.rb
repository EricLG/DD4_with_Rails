class ImplementGroup < ActiveRecord::Base
  def self.find_implement_group(groups, implement)
    groups.find { |imp| imp.name == implement }
  end

  def to_s
    self.try(:name) || ''
  end
end
