require 'import_data'

class Feat < ActiveRecord::Base

  belongs_to  :source
  has_many    :prerequisited_stats, class_name: "Stat", foreign_key: "pr_for_feat_id", dependent: :destroy
  has_many    :needed_feats, class_name: "Feat", foreign_key: "top_feat_id"
  #belongs_to  :prerequisite_for_feat,  class_name: "Feat"
  has_and_belongs_to_many :prerequisited_races,           :class_name => "Race",          :join_table => :pr_races_for_feat, dependent: :destroy
  has_and_belongs_to_many :prerequisited_klasses,         :class_name => "Klass",         :join_table => :pr_klasses_for_feat, dependent: :destroy
  has_and_belongs_to_many :prerequisited_features,        :class_name => "Feature",       :join_table => :pr_features_for_feat, dependent: :destroy

  CATEGORY = %w(heroic parangonic epic)

  def self.import_feats
    sources   = Source.all
    races     = Race.all
    klasses   = Klass.all
    features  = Feature.all
    filename  = Dir.entries('lib/import_files').find{|f| f.match(/export_talent_OK/)}
    unless filename.nil?
      ActiveRecord::Base.transaction do
        File.open(File.join('lib/import_files', filename), 'r') do |f|
          f.readline
          f.each_line do |l|  # "Titre";"Catégorie de talents";"Aptitude";"Aptitude raciale";"Talent";"5: Pouvoir";"Autre prérequis";"Compétences";"8:Classe";"Race";"Avantage";"11Stats";"Source";"Errata"
            array_line  = ImportData.clear_array_line(l.split(";", -1))
            categorie   = ImportData.find_category(array_line[1])
            klass_feat  = ImportData.find_features(array_line[2], features)
            race_feat   = ImportData.find_features(array_line[3], features)
            stats       = ImportData.create_stats(array_line[11])
            feat_pr     = Feat.where(name: array_line[4].split(',', -1).map(&:strip)) unless array_line[4].blank?
            sel_klasses = ImportData.find_klass_or_race(array_line[8], klasses)
            sel_races   = ImportData.find_klass_or_race(array_line[9], races)
            source      = sources.find{|s| s.name == array_line[12]}
            all_features = klass_feat + race_feat
            f = Feat.new(
              name:                         array_line[0],
              category:                     categorie,
              prerequisited_features:       all_features,
              needed_feats:                 feat_pr || [],
              prerequisited_power:          array_line[5],
              prerequisited_other:          array_line[6],
              prerequisited_skill:          array_line[7],
              prerequisited_klasses:        sel_klasses,
              prerequisited_races:          sel_races,
              avantage:                     array_line[10],
              prerequisited_stats:          stats,
              source:                       source,
              errata:                       array_line[13]
              )
            if f.valid?
                f.save!
            else
                logger.debug "Erreur de validation sur le talent #{f.name}"
                logger.debug "#{f.errors.full_messages}"
                f.save!
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

  def features
    if !prerequisited_features.empty?
      return prerequisited_features.map(&:name).join(', ')
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
