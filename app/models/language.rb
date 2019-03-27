class Language < ActiveRecord::Base
  has_many :choices, inverse_of: :languages
  has_many :characters, through: :choices

  # Relation pour le choix des talents d'un personnage
  has_many :chosen_feats, inverse_of: :languages
  has_many :characters, through: :chosen_feats
end
