class ArmorCategory < ActiveRecord::Base
  has_many :common_armors

  def is_shield?
    self.code == 'lightsh' || self.code == 'heavysh'
  end
end
