class Source < ActiveRecord::Base
  has_many :common_weapons
  has_many :common_armors
  has_many :magic_weapons
  has_many :magic_armors
  has_many :magic_gears
  has_many :magic_implements
  has_many :races
  has_many :klasses

  def to_s
    self.try(:name) || ""
  end

end
