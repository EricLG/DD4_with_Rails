class MagicWeaponsController < ApplicationController

  before_action :find_dependancies, only: [:new, :edit]

  def index
    @weapons = MagicWeapon.all
  end

  def new
    @weapon = MagicWeapon.new
  end

  def create
    @weapon = MagicWeapon.create(magic_weapon_params)
    if @weapon.persisted?
      redirect_to object_magic_weapon_path(@weapon.id)
    else
      render object_magic_weapon_path
    end
  end

  def destroy
    @weapon = MagicWeapon.find_by_id(params[:id])
    @weapon.destroy
    redirect_to object_magic_weapons_path
  end

  def show
    @weapon = MagicWeapon.find_by_id(params[:id])
  end

  def edit
    @weapon = MagicWeapon.find_by_id(params[:id])
  end

  def update
    @weapon = MagicWeapon.find_by_id(params[:id])
    @weapon.update!(magic_weapon_params)
    if @weapon.persisted?
      redirect_to object_magic_weapon_path(@weapon.id)
    else
      render object_magic_weapon_path
    end
  end


  private

  def magic_weapon_params
    params.require(:magic_weapon).permit(
      :name,
      :description,
      :alteration,
      :critical,
      :property,
      :power,
      :special,
      :source_id,
      {weapon_group_ids:[]},
      {object_level_ids:[]}
    )
  end

  def find_dependancies
    @weapon_groups = WeaponGroup.all
    @levels = ObjectLevel.all
    @sources = Source.all
  end
end
