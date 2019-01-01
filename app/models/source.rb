class Source < ActiveRecord::Base
  has_many :common_weapons
  has_many :common_armors
  has_many :magic_weapons
  has_many :magic_armors
  has_many :magic_gears
  has_many :magic_implements
  has_many :races
  has_many :klasses

  scope :feats, -> { where(name: FEATS) }
  scope :magic_items, -> { where(name: MAGIC_ITEMS) }
  scope :monsters, -> { where(name: MONSTERS) }

  FEATS = [
    'Art de la Guerre 1',
    'Art de la Guerre 2',
    'Eberron',
    'Force de la Nature',
    'Intervention Divine',
    'Manuel des Joueurs 1',
    'Manuel des Joueurs 2',
    'Manuel des Joueurs 3',
    'Royaumes Oubliés',
    'Secrets des Arcanes'
  ].freeze
  MAGIC_ITEMS = [
    'Le Comptoir de l\'Aventure 1',
    'Le Comptoir de l\'Aventure 2',
    'Manuel des Joueurs 1',
    'Manuel des Joueurs 2',
    'Manuel des Joueurs 3',
    'Secrets des Arcanes'
  ].freeze
  MONSTERS = [
    'Bestiaire Fantastique 1',
    'Bestiaire Fantastique 2',
    'Bestiaire Fantastique 3',
    'Chaos Élémentaire',
    'Encyclopédie des Royaumes Oubliés',
    'Manuel des Plans',
    'Mer Astrale',
    'Outreterre'
  ].freeze

  def self.find_source(sources, source)
    sources.find { |s| s.name == source }
  end

  def to_s
    self.try(:name) || ''
  end
end
