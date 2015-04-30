require 'import_data'

class Feat < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :prerequisited_races,           :class_name => "Race",          :join_table => :pr_races_for_feat
  has_and_belongs_to_many :prerequisited_klasses,         :class_name => "Klass",         :join_table => :pr_klasses_for_feat
  has_and_belongs_to_many :prerequisited_class_features,  :class_name => "ClassFeature",  :join_table => :pr_class_features_for_feat
  has_and_belongs_to_many :prerequisited_race_features,   :class_name => "RaceFeature",   :join_table => :pr_race_features_for_feat
  belongs_to :stat

  CATEGORY = %w(heroic parangonic epic)

  def self.import_feats
    sources   = Source.all
    races     = Race.all
    classes   = Klasse.all
    classes_features = ClassFeature.all
    filename  = Dir.entries('tmp/import_files').find{|f| f.match(/export_talent_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('tmp/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|  # "Titre";"Catégorie de talents";"Aptitude";"Classe";"Race";"Avantage";"Stats";"Source";"Errata"
            array_line = l.split(/";"/, -1)
            f = Feat.new(
              name:         ImportData.clear_field(array_line[0]),
              category:     ImportData.find_category(ImportData.clear_field(array_line[1])),
              prerequisited_class_features: ImportData.find_class_features(ImportData.clear_field(array_line[2]), classes_features),
              prerequisited_klasses:        ImportData.clear_field(array_line[3]),
              prerequisited_races:          ImportData.clear_field(array_line[4]),
              avantage:     ImportData.clear_field(array_line[5]),
              stat:         ImportData.clear_field(array_line[6]),
              source:       sources.find{|s| s.name == ImportData.clear_field(array_line[7])},
              errata:       ImportData.clear_field(array_line[8]),
              )
            if f.valid?
                f.save!
            else
               logger.debug "Erreur de validation sur l'arme #{m.name}"
               logger.debug "#{m.errors.full_messages}"
            end
          end
        end
      end
    end
    c = Feat.count
    logger.debug "#{c} talents ont été crées"
  end
end
