class KlassFeature < ActiveRecord::Base

  has_many    :sub_features, class_name: "KlassFeature", foreign_key: "top_feature_id", inverse_of: "top_feature"
  belongs_to  :top_feature,  class_name: "KlassFeature", inverse_of: "sub_features"
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_klass_features_for_feat

  scope :children, -> {where(status: "child") }
  scope :solos,    -> {where(status: "solo") }
  scope :tops,     -> {where(status: "top") }
  scope :main_ft,  -> {where(status: ["top", "solo"])}
end
