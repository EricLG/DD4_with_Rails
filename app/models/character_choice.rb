class CharacterChoice < ActiveRecord::Base

  belongs_to :character
  belongs_to :klass_feature
  belongs_to :race_feature
  belongs_to :language

  validates :character_id, uniqueness: {scope: :klass_feature_id}

  scope :klass_features_choices,  -> {where.not(klass_feature_id: nil) }
  scope :race_features_choices,   -> {where.not(race_feature_id: nil) }
  scope :language_choices,        -> {where.not(language_id: nil) }
end
