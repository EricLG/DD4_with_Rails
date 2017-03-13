require 'import_data'

class Monster < ActiveRecord::Base
  belongs_to :source

  RACE    = %w(Animé Bête Créature\ magique Humanoïde) #Type dans le fichier excel
  MAIN_ROLE   = %w(Artilleur Brute Chasseur Contrôleur Franc-tireur Soldat)
  SECOND_ROLE = %w(Élite Solo Sbire Normal)
  ORIGIN      = %w(Aberrante Élémentaire Féerique Immortelle Naturelle Ombreuse)

  def show_level_name
    "Niv. #{level} | #{name}"
  end
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

  def self.level_to_xp(level)
    case level
      when 1 .. 5
          100 + ((level - 1) * 25)
      when 6 .. 9
          250 + ((level - 6) * 50)
      when 10 .. 13
          500 + ((level - 10) * 100)
      when 14 .. 17
          1000 + ((level - 14) * 200)
      when 18 .. 21
          2000 + ((level - 18) * 400)
      when 22 .. 25
          4150 + ((level - 22) * 950)
      when 26 .. 29
          9000 + ((level - 26) * 2000)
      when 30 .. 33
          19000 + ((level - 30) * 4000)
      when 34 .. 37
          39000 + ((level - 34) * 8000)
      when 38 .. 40
          79000 + ((level - 38) * 16000)
      else
        0
    end
  end

  def self.correct_data
    monsters = Monster.all
    monsters.each do |m|
      m.category =m.category.capitalize
      if !m.keywords.empty?
        m.keywords = m.keywords.split(', ').map(&:capitalize).join(', ')
      end
      m.save
    end
  end
end
