class Feature < ActiveRecord::Base


  has_many    :children_features, class_name: "Feature", foreign_key: "parent_feature_id", inverse_of: "parent_feature"
  belongs_to  :parent_feature,  class_name: "Feature", inverse_of: "children_features"
  has_and_belongs_to_many :klasses, join_table: :available_features
  has_and_belongs_to_many :races, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_features_for_feat
  has_many :character_choices
  has_many :characters, through: :character_choices

  scope :main_ft,       -> {where(parent_feature_id: nil).order(:name)}
  scope :required,      -> {where(required: "required") }
  scope :first_choice,  -> {where(required: "choice_1") }
  scope :second_choice, -> {where(required: "choice_2") }
  scope :third_choice,  -> {where(required: "choice_3") }

  def complete_name
    if self.parent_feature.nil?
      self.name
    else
      "#{self.parent_feature.name} : #{self.name}"
    end
  end
end
