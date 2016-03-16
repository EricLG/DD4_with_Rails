require 'import_data'

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
  #validates :alteration, presence: true
  validates :object_levels, :length => { :minimum => 1}
  validates :source, presence: true
  validates :location, presence: true

  scope :weapons,     -> {joins(:location).where(locations: {code: "weapon"}) }
  scope :armors,      -> {joins(:location).where(locations: {code: "chest"}) }
  scope :implements,  -> {joins(:location).where(locations: {code: "implement"}) }
  scope :gears,       -> {joins(:location).where(locations: {code: Location::GEAR_CODES}) }

  def self.import_items
    sources = Source.all
    levels  = ObjectLevel.all
    weapon_groups  = WeaponGroup.all
    armor_categories = ArmorCategory.all
    implement_groups = ImplementGroup.all
    locations = Location.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/export_items/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l| # "Titre";"Description";"Altération";"Niveau minimum";"Prix par niveau et altération";"Propriété";"Pouvoir";"Spécial";"Source";"Rareté";"Critique";"Arme";"Categorie Armure";"location";"focaliseur"
            array_line = l.split(/";"/, -1)
            m = MagicItem.new()
              m.name                = ImportData.clear_field(array_line[0])
              m.description         = ImportData.clear_field(array_line[1])
              m.alteration          = ImportData.clear_field(array_line[2])
              m.location            = locations.find{|lo| lo.name == ImportData.clear_field(array_line[14])}
              object_levels = ImportData.find_level_array(m, ImportData.clear_field(array_line[3]).to_i, ImportData.clear_field(array_line[4]), levels)
              m.object_levels       =  object_levels
              m.property            = ImportData.clear_field(array_line[5])
              m.power               = ImportData.clear_field(array_line[6])
              m.special             = ImportData.clear_field(array_line[7])
              m.source              = sources.find{|s| s.name == ImportData.clear_field(array_line[8])}
              m.rarity              = ImportData.clear_field(array_line[9])
              m.critical            = ImportData.clear_field(array_line[10])
              m.weapon_groups       = ImportData.find_weapon_groups(ImportData.clear_field(array_line[11]), weapon_groups)
              m.armor_categories    = ImportData.find_armor_categories(ImportData.clear_field(array_line[12]), armor_categories)
              m.implement_group     = implement_groups.find{|ig| ig.name == ImportData.clear_field(array_line[13])}

            if m.valid?
              m.save!
            else
               logger.error "Erreur de validation sur l'objet #{m.name}"
               logger.error "#{m.errors.full_messages}"
               m.save!
            end
          end
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
      display_name = I18n.t("magic_items.rarity.#{status}")
      names << [display_name, status]
    end
    names
  end
end
