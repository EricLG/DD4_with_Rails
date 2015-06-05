require 'import_data'

class MagicImplement < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :alteration, presence: true
  validates :source, presence: true
  validates :implement_groups, :length => { :minimum => 1}
  validates :object_levels, :length => { :minimum => 1}

  def self.import_implements
    sources = Source.all
    levels  = ObjectLevel.all
    groups = ImplementGroup.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/export_focaliseur_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|
            # "Titre";"Description";"Altération";"Niveau minimum";"Critique";"Propriété";"Pouvoir";"Source";"Spécial";"Focaliseur"
            array_line = l.split(/";"/, -1)
            m = MagicImplement.new(
              name:               ImportData.clear_field(array_line[0]),
              description:        ImportData.clear_field(array_line[1]),
              alteration:         ImportData.clear_field(array_line[2]),
              critical:           ImportData.clear_field(array_line[4]),
              property:           ImportData.clear_field(array_line[5]),
              power:              ImportData.clear_field(array_line[6]),
              special:            ImportData.clear_field(array_line[8]),
              source:             sources.find{|s| s.name == ImportData.clear_field(array_line[7])},
              object_levels:      ImportData.calcul_level_array(ImportData.clear_field(array_line[3]).to_i, levels),
              implement_groups:   ImportData.find_implement_group(ImportData.clear_field(array_line[9]), groups)
              )
            if m.valid?
              begin
                m.save!
              rescue
                logger.debug "Erreur lors de l'ajout du focaliseur suivant: #{m.name}"
                logger.debug "#{m.errors.full_messages}"
              end
            else
               logger.debug "Erreur de validation sur le focaliseur #{m.name}"
               logger.debug "#{m.errors.full_messages}"
            end

          end
        end
      end
    end
    c = MagicImplement.count
    logger.debug "#{c} armures magiques ont été crées"
  end
end
