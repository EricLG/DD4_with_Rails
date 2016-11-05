class ImplementGroup < ActiveRecord::Base

  def to_s
    self.try(:name) || ""
  end

end
