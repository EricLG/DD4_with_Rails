require 'import_data'

class Feat < ActiveRecord::Base

  belongs_to  :source
  has_many    :prerequisited_stats, class_name: "Stat", foreign_key: "pr_for_feat_id", dependent: :destroy
  has_many    :needed_feats, class_name: "Feat", foreign_key: "top_feat_id"
  #belongs_to  :prerequisite_for_feat,  class_name: "Feat"
  has_and_belongs_to_many :prerequisited_races,           :class_name => "Race",          :join_table => :feats_pr_races, dependent: :destroy
  has_and_belongs_to_many :prerequisited_klasses,         :class_name => "Klass",         :join_table => :feats_pr_klasses, dependent: :destroy
  has_and_belongs_to_many :prerequisited_features,        :class_name => "Feature",       :join_table => :feats_pr_features, dependent: :destroy

  scope :feats_for_klass_and_every_klasses, -> (klasses_params) {joins("LEFT OUTER JOIN feats_pr_klasses as p ON p.feat_id = feats.id").where("p.klass_id IS NULL OR p.klass_id = ?", klasses_params)}
  scope :feats_for_race_and_every_races,    -> (races_params)   {joins("LEFT OUTER JOIN feats_pr_races as r ON r.feat_id = feats.id").where("r.race_id IS NULL OR r.race_id = ?", races_params)}
  scope :no_divine_channel, -> {where(divine_channel: false)}
  scope :no_ro, -> {where(only_ro: false)}
  scope :no_eberron, -> {where(only_eberron: false)}

  CATEGORY = %w(heroic parangonic epic)

  # Ordre affichage:
  # Carac, race, classe, pouvoir, aptitude de classe, formation de compénce, talent
  # Utilisé lors de l'import des talents
  def prerequis
    prerequis = []
    prerequis << self.stats unless self.stats.blank?
    prerequis << self.races unless self.races.blank?
    prerequis << self.klasses unless self.klasses.blank?
    prerequis << "Pouvoir " + self.prerequisited_power unless self.prerequisited_power.blank?
    prerequis << self.features unless self.features.blank?
    prerequis << self.prerequisited_skill unless self.prerequisited_skill.blank?
    prerequis << self.required_feats unless self.required_feats.blank?
    prerequis << self.prerequisited_other unless self.prerequisited_other.blank?
    return prerequis.join(', ')
  end

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
          f.each_line do |l|  # "Titre";"Catégorie de talents";"Aptitude";"Aptitude raciale";"Talent";"5: Pouvoir";"Autre prérequis";"Compétences";"8:Classe";"Race";"Avantage";"11Stats";"Source";"Errata";"specifiqueEberron";"specifiqueRO";"divineChannel"
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
              avantage:                     array_line[10].gsub("\\r\\n", "\r\n"),
              prerequisited_stats:          stats,
              source:                       source,
              errata:                       array_line[13],
              only_eberron:                 array_line[14] == 'O',
              only_ro:                      array_line[15] == 'O',
              divine_channel:               array_line[16] == 'O'
              )
            f.prerequisites = f.prerequis
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
    klasses = ""
    if !prerequisited_klasses.empty?
      klasses = Klass::grouped_klass(prerequisited_klasses.map(&:name))
    end
    klasses
  end

  def races
    if !prerequisited_races.empty?
      return prerequisited_races.map(&:name).join(', ')
    else
      return ""
    end
  end

  def features
    features = ""
    if !prerequisited_features.empty?
      features = prerequisited_features.map(&:feature_class_to_s).join(', ')
    end
    return features
  end

  def required_feats
    if !needed_feats.empty?
      return needed_feats.map(&:name).join(', ')
    else
      return ""
    end
  end

end
