class MagicItemsController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit, :weapons, :armors, :implements, :gears]

  def index
    render "object/index"
  end

  def new
    @item = MagicItem.new
  end

  def create
    @item = MagicItem.new(magic_item_params)
    if @item.save
      if params["add_another"]
        flash[:success] = "L'objet \"#{@item.name}\" a bien été créé."
        redirect_to object_magic_item_path
      else
        flash[:success] = "L'objet \"#{@item.name}\" a bien été créé."
        redirect_to object_magic_item_path(@item.id)
      end
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@item.errors.full_messages}"
      render :new
    end
  end

  def destroy
    @item = MagicItem.find_by_id(params[:id])
    @item.destroy
    redirect_to object_magic_item_path
  end

  def show
    @item = MagicItem.find_by_id(params[:id])
  end

  def edit
    @item = MagicItem.find_by_id(params[:id])
  end

  def update
    @item = MagicItem.find_by_id(params[:id])
    @item.update!(magic_item_params)
    if @item.persisted?
      redirect_to object_magic_item_path(@item.id)
    else
      render :edit
    end
  end

  def weapons
    @kind = 'weapons'
    @search = MagicItemSearch.new(params[:magic_item_search], @kind)
    @items = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :index
  end

  def armors
    @kind = 'armors'
    @search = MagicItemSearch.new(params[:magic_item_search], @kind)
    @items = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :index
  end

  def implements
    @kind = 'implements'
    @search = MagicItemSearch.new(params[:magic_item_search], @kind)
    @items = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :index
  end

  def gears
    @kind = 'gears'
    @search = MagicItemSearch.new(params[:magic_item_search], @kind)
    @items = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :index
  end

  private

  def magic_item_params
    params.require(:magic_item).permit(
      :name,
      :description,
      :alteration,
      :critical,
      :property,
      :power,
      :special,
      :implement_group_id,
      :source_id,
      {weapon_group_ids:[]},
      {armor_category_ids:[]},
      {object_level_ids:[]}
    )
  end

  def find_dependancies
    @weapon_groups    = WeaponGroup.all
    @armor_categories = ArmorCategory.all
    @implement_groups = ImplementGroup.all
    @locations        = Location.all
    @levels           = ObjectLevel.all
    @sources          = Source.all
  end
end
