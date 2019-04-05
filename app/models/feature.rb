class Feature < ApplicationRecord
  has_many :children_features, class_name: 'Feature', foreign_key: 'parent_feature_id', inverse_of: 'parent_feature'
  belongs_to :parent_feature, class_name: 'Feature', inverse_of: 'children_features'
  has_and_belongs_to_many :klasses, join_table: :available_features
  has_and_belongs_to_many :races, join_table: :available_features
  has_and_belongs_to_many :prerequisite_for_feats, class_name: 'Feat', join_table: :pr_features_for_feat

  has_many :choices, inverse_of: :features
  has_many :characters, through: :choices

  scope :main_ft,       -> { where(parent_feature_id: nil).order(:name) }
  scope :all_children,  -> { where.not(parent_feature: nil) }
  scope :required,      -> { where(required: 'required') }
  scope :first_choice,  -> { where(required: 'choice_1') }
  scope :second_choice, -> { where(required: 'choice_2') }
  scope :third_choice,  -> { where(required: 'choice_3') }

  def self.required_with_no_children
    required.where.not(id: all_children.pluck(:parent_feature_id))
  end

  def feature_class_to_s
    particule = %w[a e i o u].include?(self.name.mb_chars.downcase[0]) ? "d'" : 'de '

    if self.kind == 'race'
      "Aptitude de race de #{self.name}"
    else
      "Aptitude de classe #{particule}#{self.name}"
    end
  end
end
