require 'import_data'
require 'csv'
class MagicItem < ActiveRecord::Base

  belongs_to :source
  belongs_to :location
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :armor_categories
  belongs_to :implement_group
  has_and_belongs_to_many :object_levels

  enum rarity: { common: 1, uncommon: 2, rare: 3}

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :object_levels, :length => { :minimum => 1}
  validates :source, presence: true
  validates :location, presence: true

  scope :weapons,     -> {joins(:location).where(locations: {code: "weapon"}) }
  scope :armors,      -> {joins(:location).where(locations: {code: "chest"}) }
  scope :implements,  -> {joins(:location).where(locations: {code: "implement"}) }
  scope :gears,       -> {joins(:location).where(locations: {code: Location::GEAR_CODES}) }
  scope :amulets,     -> {joins(:location).where(locations: {code: "neck"}) }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["name", "description", "alteration", "property", "power", "special", "source", "rarity", "critical", "implement_group", "location", "weapon_groups", "armor_categories", "object_levels"]
      all.each do |item|
        csv << item.to_csv_row
      end
    end
  end

  def to_csv_row
    row = []
    row << self.name
    row << self.description.gsub("\r\n", "<br>")
    row << self.alteration.gsub("\r\n", "<br>")
    row << self.property.gsub("\r\n", "<br>")
    row << self.power.gsub("\r\n", "<br>")
    row << self.special.gsub("\r\n", "<br>")
    row << self.source.to_s
    row << self.rarity
    row << self.critical.gsub("\r\n", "<br>")
    row << self.implement_group.to_s
    row << self.location.to_s
    row << self.weapon_groups.collect{ |wp| wp.name }.join(', ')
    row << self.armor_categories.collect{ |ac| ac.name }.join(', ')
    row << self.object_levels.collect{ |ol| ol.level }.sort.join(', ')
    row
  end

  def self.import_items
    sources = Source.all
    levels  = ObjectLevel.all
    weapon_groups  = WeaponGroup.all
    armor_categories = ArmorCategory.all
    implement_groups = ImplementGroup.all
    locations = Location.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/items\.csv/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        options = {headers: true, col_sep: ";", quote_char: "\""}
        file = File.join("lib/import_files", filename)
        csv = CSV.parse(File.read(file), options )
        csv.each do |row|
          params = row.to_hash
          params["source"]            = sources.find{|s| s.name == params['source']}
          params["object_levels"]     = params["object_levels"].split(", ").collect { |pol| levels.find{|l| l.level == pol.to_i} }
          params["implement_group"]   = implement_groups.find{|imp| imp.name == params["implement_group"]}
          params["location"]          = locations.find{|location| location.name == params["location"]}
          params["weapon_groups"]     = params["weapon_groups"].split(", ").collect{ |weapons| weapon_groups.find{|wg| wg.name == weapons} }
          params["armor_categories"]  = params["armor_categories"].split(", ").collect{ |armors| armor_categories.find{|wg| wg.name == armors} }
          MagicItem.create(params)
        end
      end
    end
    c = MagicItem.count
    logger.debug "#{c} armes magiques ont été crées"
  end

  def is_weapon?
    location.name == Location::WEAPON_CODE
  end

  def is_armor?
    location.name == Location::ARMOR_CODE
  end
  def is_implement?
    location.name == Location::IMPLEMENT_CODE
  end
  def is_gear?
    Location::GEAR_CODES.include?(self.location.code)
  end
  def level_min
    self.object_levels.map(&:level).try(:min)
  end

  def self.rarity_names_for_select
    names = []
    rarities.keys.each do |status|
      display_name = MagicItem.human_attribute_name(status)
      names << [display_name, status]
    end
    names
  end
end
