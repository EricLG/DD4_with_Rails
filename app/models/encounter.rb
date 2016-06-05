require 'import_data'

class Encounter < ActiveRecord::Base
  belongs_to :source

  def self.import_encounters
    sources = Source.all
    filename = Dir.entries('lib/import_files').find{|f| f.match(/rencontres.csv/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          #f.readline
          f.each_line do |l| # "Niveau de la rencontre";"Description avec monstres et px";"Source"
            array_line = l.split(/;/, -1)
            e = Encounter.new()
              e.level         = array_line[0].to_i
              e.experience    = array_line[1].to_i
              e.description   = array_line[2].gsub("\\r\\n", "\r\n")
              e.source        = sources.find{|s| s.name == array_line[3]}

            if e.valid?
              e.save!
            else
               logger.error "Erreur de validation sur la rencontre #{e.name}"
               logger.error "#{e.errors.full_messages}"
               e.save!
            end
          end
        end
      end
    end
    e = Encounter.count
    logger.debug "#{e} rencontes ont été créées"
  end

end
