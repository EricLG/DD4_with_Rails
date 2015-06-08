class MagicGearsController < ApplicationController

  before_action :find_dependancies, only: [:new, :edit]

  def index
    @gears = MagicGear.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @gear = MagicGear.new
  end

  def create
    @gear = MagicGear.create(magic_gear_params)
    if @gear.persisted?
      redirect_to object_magic_gear_path(@gear.id)
    else
      render object_magic_gears_path
    end
  end

  def destroy
    @gear = MagicGear.find_by_id(params[:id])
    @gear.destroy
    redirect_to object_magic_gears_path
  end

  def show
    @gear = MagicGear.find_by_id(params[:id])
  end

  def edit
    @gear = MagicGear.find_by_id(params[:id])
  end

  def update
    @gear = MagicGear.find_by_id(params[:id])
    @gear.update!(magic_gear_params)
    if @gear.persisted?
      redirect_to object_magic_gear_path(@gear.id)
    else
      render object_magic_gear_path
    end
  end


  private

  def magic_gear_params
    params.require(:magic_gear).permit(
      :name,
      :description,
      :alteration,
      :property,
      :power,
      :special,
      :location_id,
      :source_id,
      {armor_category_ids:[]},
      {object_level_ids:[]}
    )
  end

  def find_dependancies
    @locations = Location.all
    @armor_categories = ArmorCategory.where(code: ['lightsh', 'heavysh'])
    @levels = ObjectLevel.all
    @sources = Source.all
  end
end
