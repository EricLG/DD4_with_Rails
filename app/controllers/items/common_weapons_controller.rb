class Items::CommonWeaponsController < ApplicationController
  def index
    @sorted_weapons = {}
    CommonWeapon.includes(:weapon_category, :weapon_properties, :weapon_groups, :source).group_by(&:category).each do |category, weapons|
      @sorted_weapons[category] = weapons.group_by(&:two_handed)
    end
    @cat = WeaponCategory.all
  end

  def new
    @weapon             = CommonWeapon.new
    @weapon_categories  = WeaponCategory.all
    @weapon_properties  = WeaponProperty.all
    @weapon_groups      = WeaponGroup.all
    @sources            = Source.all
  end

  def create
    @weapon = CommonWeapon.create(common_weapon_params)
    if @weapon.persisted?
      redirect_to items_common_weapon_path(@weapon.id)
    else
      render :new
    end
  end

  def destroy
    @weapon = CommonWeapon.find_by_id(params[:id])
    @weapon.destroy
    redirect_to items_common_weapons_path
  end

  def show
    @weapon = CommonWeapon.find_by_id(params[:id])
  end

  def edit
    @weapon_categories  = WeaponCategory.all
    @weapon_properties  = WeaponProperty.all
    @weapon_groups      = WeaponGroup.all
    @sources            = Source.all
    @weapon = CommonWeapon.find_by_id(params[:id])
  end

  def update
    @weapon = CommonWeapon.find_by_id(params[:id])
    @weapon.update!(common_weapon_params)
    if @weapon.persisted?
      redirect_to items_common_weapon_path(@weapon.id)
    else
      render :edit
    end
  end

  private

  def common_weapon_params
    params.require(:common_weapon).permit(
      :name,
      :type,
      :weight,
      :price,
      :damage,
      :handling,
      :range,
      :two_handed,
      :source_id,
      :weapon_category_id,
      weapon_group_ids: [],
      weapon_property_ids: []
    )
  end
end
