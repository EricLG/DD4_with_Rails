module CommonArmorsHelper
  def localize_bonus_type(common_armor)
    common_armor.armor_category.shield? ? CommonArmor.human_attribute_name('shield_bonus') : CommonArmor.human_attribute_name('armor_bonus')
  end
end
