class MagicGear < ActiveRecord::Base

  belongs_to :source
  belongs_to :location
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :object_levels

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  validates :source, presence: true
  validates :object_levels, :length => { :minimum => 1}

  def alteration?
    self.location.code == 'implement' || self.location.code == "weapon" || self.location.code == "neck"
  end
end
