class ChosenFeat < ApplicationRecord
  belongs_to :character
  belongs_to :feat
  has_and_belongs_to_many :languages
  belongs_to :weapon_group
  belongs_to :proficiency, class_name: "CommonWeapon"
  belongs_to :implement_group
  belongs_to :ability
  belongs_to :skill

  # Ajoute les talents obtenus gratuitement par les choix du joueur
  # feat_name: String, owned_feat_ids : [int], character_id: int
  def self.add_free_feat(feat_name, owned_feat_ids, character_id)
    feat = Feat.find_by_name(feat_name)
    ChosenFeat.create(feat_id: feat.id, character_id: character_id, free: true) unless feat.nil? || owned_feat_ids.include?(feat.id)
  end

  # Language[] - Retourne un tableau de langues choisies par talent
  def self.languages
    self.includes(:languages).where.not(languages: { language: nil }).map(&:languages).flatten
  end
end
