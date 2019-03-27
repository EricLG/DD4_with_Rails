class ImplementGroup < ActiveRecord::Base
  # Relation pour le choix des talents d'un personnage
  has_many :chosen_feats, inverse_of: :implement_groups
  has_many :characters, through: :chosen_feats
  def self.find_implement_group(groups, implement)
    groups.find { |imp| imp.name == implement }
  end

  def to_s
    self.try(:name) || ''
  end
end
