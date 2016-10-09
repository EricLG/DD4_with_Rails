class Items::CommonArmorsController < ApplicationController

  def index
    @communs = CommonArmor.includes(:armor_category, :source).armors.order(:armor_bonus, :min_alteration_bonus).group_by(&:category)
    @cat  = ArmorCategory.armors
  end

  def shields
    @communs = CommonArmor.includes(:armor_category, :source).shields.order(:armor_bonus, :min_alteration_bonus).group_by(&:category)
    @cat  = ArmorCategory.shields
    render :index
  end

  def new
    @armor             = CommonArmor.new
    @armor_categories  = ArmorCategory.all
    @sources           = Source.all
  end

  def create
    @armor = CommonArmor.create(common_armor_params)
    if @armor.persisted?
      redirect_to items_common_armor_path(@armor.id)
    else
      render :new
    end
  end

  def destroy
     @armor = CommonArmor.find_by_id(params[:id])
     @armor.destroy
     redirect_to items_common_armors_path
  end

  def show
    @armor = CommonArmor.find_by_id(params[:id])
  end

  def edit
    @armor = CommonArmor.find_by_id(params[:id])
    @armor_categories  = ArmorCategory.armors   if !@armor.is_shield?
    @armor_categories  = ArmorCategory.shields  if @armor.is_shield?
    @sources           = Source.all
  end

  def update
    @armor = CommonArmor.find_by_id(params[:id])
    @armor.update!(common_armor_params)
    if @armor.persisted?
      redirect_to items_common_armor_path(@armor.id)
    else
      render :edit
    end
  end

  private
  def common_armor_params
    params.require(:common_armor).permit(
      :name,
      :weight,
      :price,
      :armor_bonus,
      :min_alteration_bonus,
      :skill_malus,
      :ms_malus,
      :special,
      :source_id,
      :armor_category_id
    )
  end
end
