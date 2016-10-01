class RaceFeature < ActiveRecord::Base

  has_many    :children_features, class_name: "RaceFeature", foreign_key: "parent_feature_id", inverse_of: "parent_feature"
  belongs_to  :parent_feature,  class_name: "RaceFeature", inverse_of: "children_features"
  has_and_belongs_to_many :races
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_race_features_for_feat
  has_many :character_choices
  has_many :characters, through: :character_choices


  scope :main_ft,       -> {where(parent_feature_id: nil).order(:name)}
  scope :required,      -> {where(required: "required") }
  scope :first_choice,  -> {where(required: "choice_1") }
end
