class FeaturesChoice < ActiveRecord::Base

  belongs_to :character
  belongs_to :klass_feature

  validates :character_id, uniqueness: {scope: :klass_feature_id}
end
