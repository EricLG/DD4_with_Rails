class Klass < ActiveRecord::Base

  belongs_to :source
  has_many :class_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_klasses_for_feat
end
