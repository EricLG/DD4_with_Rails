class Race < ActiveRecord::Base

  belongs_to :source
  has_many :stats, autosave: true
  belongs_to :skill
  has_and_belongs_to_many :race_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_races_for_feat

end
