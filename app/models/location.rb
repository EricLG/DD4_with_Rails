class Location < ApplicationRecord
  has_one :magic_item

  WEAPON = 'weapon'.freeze
  SECOND_HAND = 'second_hand'.freeze
  ARMOR = 'chest'.freeze
  IMPLEMENT = 'implement'.freeze
  SECOND_IMPLEMENT = 'second_implement'.freeze
  HEAD = 'head'.freeze
  NECK = 'neck'.freeze
  BELT = 'belt'.freeze
  HANDS = 'hands'.freeze
  RING = 'ring'.freeze
  RING_FIRST = 'ring1'.freeze
  RING_SECOND = 'ring2'.freeze
  ARM = 'arm'.freeze
  FOOTS = 'foots'.freeze
  GEARS = %w[head belt hands ring arm foots].freeze

  scope :gears, -> { where(code: Location::GEARS) }

  def self.find_location(locations, location)
    locations.find { |loc| loc.name == location }
  end

  def to_s
    self.try(:name) || ''
  end
end
