class ClassFeature < ActiveRecord::Base

  has_many    :sub_features, class_name: "ClassFeature", foreign_key: "top_feature_id"
  belongs_to  :top_feature,  class_name: "ClassFeature"
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_class_features_for_feat
end
