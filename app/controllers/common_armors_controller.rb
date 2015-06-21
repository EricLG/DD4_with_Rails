class CommonArmorsController < ApplicationController

  def index
    @communs = CommonArmor.includes(:armor_category, :source).group_by(&:category)
    @cat  = ArmorCategory.all
  end

  def new
    @armor             = CommonArmor.new
    @armor_categories  = ArmorCategory.all
    @sources           = Source.all
  end

  def create
    @armor = CommonArmor.create(common_armor_params)
    if @armor.persisted?
      redirect_to object_common_armor_path(@armor.id)
    else
      render object_common_armor_path
    end
  end

  def destroy
     @armor = CommonArmor.find_by_id(params[:id])
     @armor.destroy
     redirect_to object_common_armors_path
  end

  def show
    @armor = CommonArmor.find_by_id(params[:id])
  end

  def edit
    @armor_categories  = ArmorCategory.all
    @sources            = Source.all
    @armor = CommonArmor.find_by_id(params[:id])
  end

  def update
    @armor = CommonArmor.find_by_id(params[:id])
    @armor.update!(common_armor_params)
    if @armor.persisted?
      redirect_to object_common_armor_path(@armor.id)
    else
      render object_common_armor_path
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
