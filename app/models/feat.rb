require 'import_data'

class Feat < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :races
  has_and_belongs_to_many :klasses

  CATEGORY = %w(heroic parangonic epic)

  def self.import_feats
    sources = Source.all
    races = Race.all
    classes = Klasse.all
    filename = Dir.entries('tmp/import_files').find{|f| f.match(/export_talent_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('tmp/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|  # "Titre";"Catégorie de talents";"Aptitude";"Classe";"Race";"Avantage";"Stats";"Source";"Errata"
            array_line = l.split(/";"/, -1)
            m = MagicWeapon.new(
              name:           ImportData.clear_field(array_line[0]),
              category:       ImportData.clear_field(array_line[1]),
              alteration:     ImportData.clear_field(array_line[2]),
              critical:       ImportData.clear_field(array_line[6]),
              property:       ImportData.clear_field(array_line[7]),
              power:          ImportData.clear_field(array_line[8]),
              special:        ImportData.clear_field(array_line[10]),
              source:         sources.find{|s| s.name == ImportData.clear_field(array_line[9])},
              object_levels:  ImportData.calcul_level_array(ImportData.clear_field(array_line[3]).to_i, levels),
              weapon_groups:  ImportData.find_weapon_groups(ImportData.clear_field(array_line[5]), groups)
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
    c = MagicWeapon.count
    logger.debug "#{c} armes magiques ont été crées"
  end
end
