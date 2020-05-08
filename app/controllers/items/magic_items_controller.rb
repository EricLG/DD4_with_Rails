class Items::MagicItemsController < ApplicationController
  layout 'no_sidebloc', only: :random
  before_action :find_dependancies, only: %i[index new edit weapons armors implements gears amulets]

  def index
    render 'items/index'
  end

  def new
    @item = MagicItem.new
  end

  def create
    @item = MagicItem.new(magic_item_params)
    if @item.save
      flash[:success] = "L'objet \"#{@item.name}\" a bien été créé."
      if params['add_another']
        redirect_to new_items_magic_item_path
      else
        redirect_to items_magic_item_path(@item.id)
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
    redirect_to items_index_path
  end

  def show
    @item = MagicItem.find_by_id(params[:id])
    @wishlist = Wishlist.new
    @heroes_with_item_in_wishlist = []
    @heroes_without_item_in_wishlist = []
    heroes_without_equipped_item = []
    heroes_with_equipped_item = []
    @current_user.characters.each do |character|
      # Wishlist
      if character.magic_item_ids.include?(@item.id)
        @heroes_with_item_in_wishlist << character
      else
        @heroes_without_item_in_wishlist << character
      end
      # Equipment form
      hero_have_item = false
      character.equipment.each do |e|
        if e.magic_item_id == @item.id
          hero_have_item = true
          heroes_with_equipped_item << e
        end
      end
      heroes_without_equipped_item << character unless hero_have_item
    end
    @equipment_form_variables = { item: @item, heroes_without_equipped_item: heroes_without_equipped_item, heroes_with_equipped_item: heroes_with_equipped_item, equipment: Equipment.new }
  end

  def edit
    @item = MagicItem.find_by_id(params[:id])
  end

  def update
    @item = MagicItem.find_by_id(params[:id])
    if @item.update(magic_item_params)
      redirect_to items_magic_item_path(@item.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@item.errors.full_messages}"
      render :edit
    end
  end

  def weapons
    @kind = 'weapons'
    @search = MagicItemSearch.new(search_magic_item_params, @kind)
    @items = @search.build_search.paginate(page: params[:page], per_page: 20).order(name: :asc).to_a
    @items_count = @items.count
    render :index
  end

  def armors
    @kind = 'armors'
    @armor_categories = @armor_categories.reject(&:shield?)
    @search = MagicItemSearch.new(search_magic_item_params, @kind)
    @items = @search.build_search.paginate(page: params[:page], per_page: 20).order(name: :asc)
    render :index
  end

  def implements
    @kind = 'implements'
    @search = MagicItemSearch.new(search_magic_item_params, @kind)
    @items = @search.build_search.paginate(page: params[:page], per_page: 20).order(name: :asc)
    render :index
  end

  def gears
    @kind = 'gears'
    @search = MagicItemSearch.new(search_magic_item_params, @kind)
    @items = @search.build_search.paginate(page: params[:page], per_page: 20).order(name: :asc)
    @locations = @locations.gears
    render :index
  end

  def amulets
    @kind = 'amulets'
    @search = MagicItemSearch.new(search_magic_item_params, @kind)
    @items = @search.build_search.paginate(page: params[:page], per_page: 20).order(name: :asc)
    render :index
  end

  def random
    @random_objects = MagicItem.all.sample(10)
  end

  def wishlist
    @item = MagicItem.find_by_id(params[:id])
    wishlist = Wishlist.new(wishlist_params)
    if wishlist.save
      flash[:success] = "L'objet \"#{@item.name}\" fait maintenant partie de votre liste de souhait."
    else
      flash[:error] = "L'objet \"#{@item.name}\" n'a pas été ajouté à votre liste de souhait."
    end
    redirect_to items_magic_item_path(@item.id)
  end

  def wishlist_remove
    wished_item = MagicItem.find_by_id(params[:item])
    character = Character.find_by_id(params[:character])
    if character.magic_items.delete wished_item
      flash[:success] = "L'objet \"#{wished_item&.name}\" est maintenant retiré de la liste de souhait de #{character.name}."
    else
      flash[:error] = "L'objet \"#{wished_item&.name}\" n'a pas été retiré de votre liste de souhait."
    end
    redirect_back(fallback_location: root_path)
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
      :location_id,
      :rarity,
      :implement_group_id,
      :source_id,
      object_level_ids: [],
      weapon_group_ids: [],
      armor_category_ids: [],
      items_level_ids: []
    )
  end

  def search_magic_item_params
    return unless params && params[:magic_item_search]

    params.require(:magic_item_search).permit(
      :name,
      :location,
      :rarity,
      :implement_group,
      :source,
      :object_levels,
      weapon_groups: [],
      armor_categories: [],
      items_levels: []
    )
  end

  def wishlist_params
    params.require(:wishlist).permit(
      :user_id,
      :magic_item_id,
      :character_id
    )
  end

  def find_dependancies
    @weapon_groups    = WeaponGroup.all
    @armor_categories = ArmorCategory.all
    @implement_groups = ImplementGroup.all
    @locations        = Location.all
    @levels           = ObjectLevel.all
    @sources          = Source.magic_items
  end
end
