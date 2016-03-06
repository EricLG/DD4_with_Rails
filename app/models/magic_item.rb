require 'import_data'

class MagicItem < ActiveRecord::Base

  belongs_to :source
  belongs_to :location
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  #validates :alteration, presence: true
  validates :object_levels, :length => { :minimum => 1}
  validates :source, presence: true
  validates :location, presence: true

  GEAR_LOCATION = %w(head neck belt hands ring arm foots)
  scope :weapons,     -> {joins(:location).where(locations: {code: "weapon"}) }
  scope :armors,      -> {joins(:location).where(locations: {code: "armor"}) }
  scope :implements,  -> {joins(:location).where(locations: {code: "implement"}) }
  scope :gears,       -> {joins(:location).where(locations: {code: GEAR_LOCATION}) }

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
              binding.pry if m.location.blank?
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
              m.implement_groups    = ImportData.find_implement_group(ImportData.clear_field(array_line[13]), implement_groups) # Absent sur les armes et armures certaineemnt

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

  def is_gear?
    GEAR_LOCATION.include?(location.code)
  end

end
