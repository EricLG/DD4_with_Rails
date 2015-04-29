class ClassFeature < ActiveRecord::Base

  belongs_to :klass
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_class_features_for_feat
end
