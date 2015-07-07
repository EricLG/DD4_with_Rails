class MagicWeaponsController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit]

  def index
    @search = MagicSearch.new(params[:magic_search], MagicWeapon)
    @weapons = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
  end

  def new
    @weapon = MagicWeapon.new
  end

  def create
    @weapon = MagicWeapon.new(magic_weapon_params)
    if @weapon.save
      if params["add_another"]
        flash[:success] = "L'objet \"#{@weapon.name}\" a bien été créé."
        redirect_to new_object_magic_weapon_path
      else
        flash[:success] = "L'objet \"#{@weapon.name}\" a bien été créé."
        redirect_to object_magic_weapon_path(@weapon.id)
      end
    else
      @weapon_groups = WeaponGroup.all
      @levels = ObjectLevel.all
      @sources = Source.all
      flash[:error] = "Erreur sur les champs suivants: #{@weapon.errors.full_messages}"
      render :new
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
