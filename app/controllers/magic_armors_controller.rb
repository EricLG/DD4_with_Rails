class MagicArmorsController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit]

  def index
    @search = MagicSearch.new(params[:magic_search], MagicArmor)
    @armors = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
  end

  def new
    @armor = MagicArmor.new
  end

  def create
    @armor = MagicArmor.create(magic_armor_params)
    if @armor.persisted?
      redirect_to object_magic_armor_path(@armor.id)
    else
      render object_magic_armor_path
    end
  end

  def destroy
    @armor = MagicArmor.find_by_id(params[:id])
    @armor.destroy
    redirect_to object_magic_armors_path
  end

  def show
    @armor = MagicArmor.find_by_id(params[:id])
  end

  def edit
    @armor = MagicArmor.find_by_id(params[:id])
  end

  def update
    @armor = MagicArmor.find_by_id(params[:id])
    @armor.update!(magic_armor_params)
    if @armor.persisted?
      redirect_to object_magic_armor_path(@armor.id)
    else
      render object_magic_armor_path
    end
  end


  private

  def magic_armor_params
    params.require(:magic_armor).permit(
      :name,
      :description,
      :alteration,
      :property,
      :power,
      :special,
      :source_id,
      {armor_category_ids:[]},
      {object_level_ids:[]}
    )
  end

  def find_dependancies
    @armor_categories = ArmorCategory.all
    @levels = ObjectLevel.all
    @sources = Source.all
  end
end
