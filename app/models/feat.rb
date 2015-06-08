require 'import_data'

class Feat < ActiveRecord::Base

  belongs_to  :source
  has_many    :prerequisited_stats, class_name: "Stat", foreign_key: "pr_for_feat_id"
  has_many    :needed_feats, class_name: "Feat", foreign_key: "top_feat_id"
  belongs_to  :prerequisite_for_feat,  class_name: "Feat"
  has_and_belongs_to_many :prerequisited_races,           :class_name => "Race",          :join_table => :pr_races_for_feat
  has_and_belongs_to_many :prerequisited_klasses,         :class_name => "Klass",         :join_table => :pr_klasses_for_feat
  has_and_belongs_to_many :prerequisited_class_features,  :class_name => "ClassFeature",  :join_table => :pr_class_features_for_feat
  has_and_belongs_to_many :prerequisited_race_features,   :class_name => "RaceFeature",   :join_table => :pr_race_features_for_feat

  CATEGORY = %w(heroic parangonic epic)

  def self.import_feats
    sources   = Source.all
    races     = Race.all
    classes   = Klass.all
    classes_features = ClassFeature.all
    races_features = RaceFeature.all
    filename  = Dir.entries('lib/import_files').find{|f| f.match(/export_talent_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|  # "Titre";"Catégorie de talents";"Aptitude";"Aptitude raciale";"Talent";"5: Pouvoir";"Autre prérequis";"Compétences";"8:Classe";"Race";"Avantage";"11Stats";"Source";"Errata"
            array_line  = ImportData.clear_array_line(l.split(";", -1))
            categorie   = ImportData.find_category(array_line[1])
            class_feat  = ImportData.find_class_features(array_line[2], classes_features)
            race_feat   = ImportData.find_race_features(array_line[3], races_features)
            stats       = ImportData.create_stats(array_line[11])
            feat_pr     = Feat.where(name: array_line[4].split(',', -1).map(&:strip)) unless array_line[4].blank?
            sel_classes = ImportData.find_klass_or_race(array_line[8], classes)
            sel_races   = ImportData.find_klass_or_race(array_line[9], races)
            source      = sources.find{|s| s.name == array_line[12]}
            f = Feat.new(
              name:                         array_line[0],
              category:                     categorie,
              prerequisited_class_features: class_feat,
              prerequisited_race_features:  race_feat,
              needed_feats:                 feat_pr || [],
              prerequisited_power:          array_line[5],
              prerequisited_other:          array_line[6],
              prerequisited_skill:          array_line[7],
              prerequisited_klasses:        sel_classes,
              prerequisited_races:          sel_races,
              avantage:                     array_line[10],
              prerequisited_stats:          stats,
              source:                       source,
              errata:                       array_line[13]
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

  def stats
    if !prerequisited_stats.empty?
      return prerequisited_stats.map(&:to_s).join('  ou ')
    else
      return ""
    end
  end

  def klasses
    if !prerequisited_klasses.empty?
      return prerequisited_klasses.map(&:name).join(', ')
    else
      return ""
    end
  end

  def races
    if !prerequisited_races.empty?
      return prerequisited_races.map(&:name).join(', ')
    else
      return ""
    end
  end

  def class_features
    if !prerequisited_class_features.empty?
      return prerequisited_class_features.map(&:name).join(', ')
    else
      return ""
    end
  end

  def race_features
    if !prerequisited_race_features.empty?
      return prerequisited_race_features.map(&:name).join(', ')
    else
      return ""
    end
  end

  def required_feats
    if !needed_feats.empty?
      return needed_feats.map(&:name).join(', ')
    else
      return ""
    end
  end

end
