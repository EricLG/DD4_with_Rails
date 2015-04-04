require 'import_data'

class MagicArmor < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :alteration, presence: true
  validates :source, presence: true
  validates :armor_categories, :length => { :minimum => 1}
  validates :object_levels, :length => { :minimum => 1}

  def self.import_armors
    sources = Source.all
    levels  = ObjectLevel.all
    categories = ArmorCategory.all
    filename = Dir.entries('tmp/import_files').find{|f| f.match(/export_armure_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('tmp/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|
            # "Titre";"Armure";"Description";"Altération";"Niveau minimum";"Propriété";"Pouvoir";"Spécial";"Source"
            array_line = l.split(/";"/, -1)
            m = MagicArmor.new(
              name:               ImportData.clear_field(array_line[0]),
              description:        ImportData.clear_field(array_line[2]),
              alteration:         ImportData.clear_field(array_line[3]),
              property:           ImportData.clear_field(array_line[5]),
              power:              ImportData.clear_field(array_line[6]),
              special:            ImportData.clear_field(array_line[7]),
              source:             sources.find{|s| s.name == ImportData.clear_field(array_line[8])},
              object_levels:      ImportData.calcul_level_array(ImportData.clear_field(array_line[4]).to_i, levels),
              armor_categories:   ImportData.find_armor_categories(ImportData.clear_field(array_line[1]), categories)
              )
            if m.valid?
              begin
                m.save!
              rescue
                logger.debug "Erreur lors de l'ajout de l'arme suivante: #{m.name}"
                logger.debug "#{m.errors.full_messages}"
              end
            else
               logger.debug "Erreur de validation sur l'arme #{m.name}"
               logger.debug "#{m.errors.full_messages}"
            end
          end
        end
      end
    end
    c = MagicArmor.count
    logger.debug "#{c} armures magiques ont été crées"
  end
end
