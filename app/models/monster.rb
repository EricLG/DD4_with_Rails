require 'import_data'

class Monster < ActiveRecord::Base
  belongs_to :source

  RACE    = %w(Animé Bête Créature\ magique Humanoïde) #Type dans le fichier excel
  MAIN_ROLE   = %w(Artilleur Brute Chasseur Contrôleur Franc-tireur Soldat)
  SECOND_ROLE = %w(Élite Solo Sbire Normal)
  ORIGIN      = %w(Aberrante Élémentaire Féerique Immortelle Naturelle Ombreuse)

  def self.import_monsters
    sources = Source.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/monstres.csv/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l| # "Nom";"Role";"Role secondaire";"Meneur";"Niveau";"Source";"Race/category";"XP";"Type/race";"Origine";"Mot cles";"Lieux de predilection"
            array_line = l.split(/;/, -1)
            m = Monster.new()
              m.name          = array_line[0]
              m.main_role     = array_line[1]
              m.second_role   = array_line[2]
              m.leader        = array_line[3] == "Oui"
              m.level         = array_line[4]
              m.source        = sources.find{|s| s.name == array_line[5]}
              m.category      = array_line[6]
              m.px            = array_line[7]
              m.race          = array_line[8]
              m.origin        = array_line[9]
              m.keywords      = array_line[10]

            if m.valid?
              m.save!
            else
               logger.error "Erreur de validation sur le monstre #{m.name}"
               logger.error "#{m.errors.full_messages}"
               m.save!
            end
          end
        end
      end
    end
    c = Monster.count
    logger.debug "#{c} monstres ont été créés"
  end


end
