class ObjetCommun < ActiveRecord::Base

  has_one :source
  has_one :categorie_armes
  has_many :groupe_arme
  has_many :proprietes_armes
end
