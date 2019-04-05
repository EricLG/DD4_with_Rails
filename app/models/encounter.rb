require 'import_data'

class Encounter < ApplicationRecord
  belongs_to :source
  DEFAULT_BUDGET = 500

  def self.import_encounters
    sources = Source.all
    filename = Dir.entries(Rails.root + 'lib/import_files').find { |f| f.match(/rencontres.csv/) }
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join(Rails.root, 'lib', 'import_files', filename), 'r') do |f|
          # "Niveau de la rencontre";"Description avec monstres et px";"Source"
          f.each_line do |l|
            array_line = l.split(/;/, -1)
            e = Encounter.new
            e.level         = array_line[0].to_i
            e.experience    = array_line[1].to_i
            e.description   = array_line[2].gsub('\\r\\n', '\r\n')
            e.source        = sources.find { |s| s.name == array_line[3] }

            unless e.valid?
              logger.error "Erreur de validation sur la rencontre #{e.name}"
              logger.error e.errors.full_messages.to_s
            end
            e.save!
          end
        end
      end
    end
    e = Encounter.count
    logger.debug "#{e} rencontes ont été créées"
  end
end
