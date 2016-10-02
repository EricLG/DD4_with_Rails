class CharacterChoice < ActiveRecord::Base

  belongs_to :character
  belongs_to :feature
  belongs_to :language

  validates :character_id, uniqueness: {scope: :feature_id}

  scope :klass_features_choices,  -> {joins(:feature).where(features: {kind: 'klass'}).where.not(feature_id: nil) }
  scope :race_features_choices,   -> {joins(:feature).where(features: {kind: 'race'}).where.not(feature_id: nil) }
  scope :features_choices,        -> {where.not(feature_id: nil) }
  scope :language_choices,        -> {where.not(language_id: nil) }
end
