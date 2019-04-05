require 'import_data'
require 'csv'
class MagicItem < ApplicationRecord
  has_many :wishlists
  has_many :users, through: :wishlists
  has_many :characters, through: :wishlists

  belongs_to :source
  belongs_to :location
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :armor_categories
  belongs_to :implement_group
  has_and_belongs_to_many :object_levels

  enum rarity: { common: 1, uncommon: 2, rare: 3 }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :object_levels, length: { minimum: 1 }
  validates :source, presence: true
  validates :rarity, presence: true
  validates :location, presence: true

  scope :weapons,     -> { joins(:location).where(locations: { code: 'weapon' }) }
  scope :armors,      -> { joins(:location).where(locations: { code: 'chest' }) }
  scope :implements,  -> { joins(:location).where(locations: { code: 'implement' }) }
  scope :gears,       -> { joins(:location).where(locations: { code: Location::GEAR_CODES }) }
  scope :amulets,     -> { joins(:location).where(locations: { code: 'neck' }) }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['name', 'description', 'alteration', 'property', 'power', 'special', 'source', 'rarity', 'critical', 'implement_group', 'location', 'weapon_groups', 'armor_categories', 'object_levels']
      all.each do |item|
        csv << item.to_csv_row
      end
    end
  end

  def to_csv_row
    row = []
    row << self.name
    row << self.description.gsub("\r\n", '<br>')
    row << self.alteration.gsub("\r\n", '<br>')
    row << self.property.gsub("\r\n", '<br>')
    row << self.power.gsub("\r\n", '<br>')
    row << self.special.gsub("\r\n", '<br>')
    row << self.source.to_s
    row << self.rarity
    row << self.critical.gsub("\r\n", '<br>')
    row << self.implement_group.to_s
    row << self.location.to_s
    row << self.weapon_groups.collect(&:name).join(', ')
    row << self.armor_categories.collect(&:name).join(', ')
    row << self.object_levels.collect(&:level).sort.join(', ')
    row
  end

  def self.import_items
    all_infos = ImportData.import_all_informations
    file = File.read(File.join(Rails.root, 'lib', 'import_files', 'items.csv'))
    csv = CSV.parse(file, headers: true, col_sep: ';', quote_char: '"')
    csv.each do |row|
      params = row.to_hash
      params = MagicItem.collect_row_data(all_infos, params)
      MagicItem.create(params)
    end
    logger.debug "#{MagicItem.count} armes magiques ont été crées"
  end

  def self.collect_row_data(all_infos, params)
    params['source'] = Source.find_source(all_infos[:sources], params['source'])
    params['object_levels'] = ObjectLevel.find_object_levels(all_infos[:levels], params['object_levels'])
    params['implement_group'] = ImplementGroup.find_implement_group(all_infos[:implements], params['implement_group'])
    params['location'] = Location.find_location(all_infos[:locations], params['location'])
    params['weapon_groups'] = WeaponGroup.find_weapon_groups(all_infos[:groups], params['weapon_groups'])
    params['armor_categories'] = ArmorCategory.find_armor_categories(all_infos[:categories], params['armor_categories'])
    params
  end

  def gear?
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
