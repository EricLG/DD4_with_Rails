class Location < ActiveRecord::Base

  has_one :magic_item

  WEAPON_CODE = 'weapon'
  ARMOR_CODE = 'chest'
  IMPLEMENT_CODE = 'implement'
  GEAR_CODES = %w(head belt hands ring arm foots)

  scope :gears, -> {where(code: Location::GEAR_CODES) }

  def to_s
    self.try(:name) || ""
  end

end
