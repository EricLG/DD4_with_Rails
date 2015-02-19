class MagicWeapon < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :weapon_groups
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :alteration, presence: true
  validates :source, presence: true
  validates :weapon_groups, :length => { :minimum => 1}
  validates :object_levels, :length => { :minimum => 1}
end
