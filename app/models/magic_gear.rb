require 'import_data'

class MagicGear < ActiveRecord::Base

  belongs_to :source
  belongs_to :location
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  validates :source, presence: true
  validates :object_levels, :length => { :minimum => 1}

  def alteration?
    self.location.code == 'implement' || self.location.code == "weapon" || self.location.code == "neck"
  end

  def self.import_gears
    sources = Source.all
    levels  = ObjectLevel.all
    location = Location.all
    categories = ArmorCategory.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/export_equipement_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|
            # "Titre";"Niveau minimum";"Description";"Prix par niveau et altération";"Emplacement d'objet";"Altération";"Catégorie de bouclier";"Propriété";"Pouvoir";"Spécial";"Source"
            array_line = l.split(/";"/, -1)
            m = MagicGear.new(
              name:               ImportData.clear_field(array_line[0]),
              description:        ImportData.clear_field(array_line[2]),
              alteration:         ImportData.clear_field(array_line[5]),
              location:           location.find{|l| l.name == ImportData.clear_field(array_line[4])},
              property:           ImportData.clear_field(array_line[7]),
              power:              ImportData.clear_field(array_line[8]),
              special:            ImportData.clear_field(array_line[9]),
              source:             sources.find{|s| s.name == ImportData.clear_field(array_line[10])},
              object_levels:      ImportData.find_each_level(ImportData.clear_field(array_line[3]), levels),
              armor_categories:   ImportData.find_armor_categories(ImportData.clear_field(array_line[6]), categories)
              )
            if m.valid?
              m.save
            else
              logger.debug "Erreur de validation sur l'équipement #{m.name}"
              logger.debug "#{m.errors.full_messages}"
            end

          end
        end
      end
    end
    c = MagicGear.count
    logger.debug "#{c} équipements magiques ont été crées"
  end

end
