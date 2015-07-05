module CommonWeaponsHelper

  def localize_weapon_usage(value)
    case value
    when "one"
      return t('common.weapon.usage.one')
    when "two"
      return t('common.weapon.usage.two')
    when "double"
      return t('common.weapon.usage.double')
    else
      return t('common.weapon.usage.unknow')
    end
  end
end
