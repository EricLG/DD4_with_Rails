class CommonArmor < ActiveRecord::Base

  belongs_to :source
  belongs_to :armor_category

end
