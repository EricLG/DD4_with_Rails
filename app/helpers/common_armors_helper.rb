module CommonArmorsHelper

  def localize_bonus_type(common_armor)
    common_armor.armor_category.is_shield? ? t('common.armor.shield_bonus') : t('common.armor.armor_bonus')
  end
end
