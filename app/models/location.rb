class Location < ApplicationRecord
  has_one :magic_item

  WEAPON_CODE = 'weapon'.freeze
  ARMOR_CODE = 'chest'.freeze
  IMPLEMENT_CODE = 'implement'.freeze
  GEAR_CODES = %w[head belt hands ring arm foots].freeze

  scope :gears, -> { where(code: Location::GEAR_CODES) }

  def self.find_location(locations, location)
    locations.find { |loc| loc.name == location }
  end

  def to_s
    self.try(:name) || ''
  end
end
