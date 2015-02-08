class CommonWeaponsController < ApplicationController

  def index
    @communs = CommonWeapon.all
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
      redirect_to object_common_weapon_path(@weapon.id)
    else
      render object_common_weapon_path
    end
  end

  def destroy
     @weapon = CommonWeapon.find_by_id(params[:id])
     @weapon.destroy
     redirect_to action: :index
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
      redirect_to object_common_weapon_path(@weapon.id)
    else
      render object_common_weapon_path
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
      {weapon_group_ids:[]},
      {weapon_property_ids:[]}
    )
  end
end
