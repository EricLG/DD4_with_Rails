class ArmorCategory < ActiveRecord::Base
  has_many :common_armors
  has_and_belongs_to_many :magic_armors

  def is_shield?
    self.code == 'lightsh' || self.code == 'heavysh'
  end
end
