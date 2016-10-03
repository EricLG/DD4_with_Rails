class Choice < ActiveRecord::Base

  belongs_to :character,  inverse_of: :choices
  belongs_to :feature,    inverse_of: :choices
  belongs_to :language,   inverse_of: :choices

  validates :character_id, uniqueness: {scope: [:feature_id, :language_id]}

  scope :klass_features_choices,  -> {joins(:feature).where(features: {kind: 'klass'}).where.not(feature_id: nil) }
  scope :race_features_choices,   -> {joins(:feature).where(features: {kind: 'race'}).where.not(feature_id: nil) }
  scope :features_choices,        -> {where.not(feature_id: nil) }
  scope :languages_choices,       -> {where.not(language_id: nil) }
end
