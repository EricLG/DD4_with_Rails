class RaceFeature < ActiveRecord::Base

  has_and_belongs_to_many :races
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_race_features_for_feat

end
