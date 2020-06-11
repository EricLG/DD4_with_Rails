class Items::ImplementsController < ApplicationController
  def index
    @implements = Implement.includes(:implement_properties).order(:name)
    @implement_properties = ImplementProperty.all
  end

  def new
    @implement = Implement.new
    @implement_properties = ImplementProperty.all
    @implement_groups = ImplementGroup.all
  end

  def create
    @implement = Implement.create(implement_params)
    if @implement.persisted?
      redirect_to items_implement_path(@implement.id)
    else
      render :new
    end
  end

  def destroy
    @implement = Implement.find_by_id(params[:id])
    @implement.destroy
    redirect_to items_implements_path
  end

  def show
    @implement = Implement.joins(:implement_group).select('implements.*').join_implement_group_name.find_by_id(params[:id])
    @properties = @implement.implement_properties.empty? ? 'Aucune' : @implement.implement_properties.map(&:name).join(', ')
  end

  def edit
    @implement = Implement.find_by_id(params[:id])
    @implement_properties = ImplementProperty.all
    @implement_groups = ImplementGroup.all
  end

  def update
    @implement = Implement.find_by_id(params[:id])
    @implement.update!(implement_params)
    if @implement.persisted?
      redirect_to items_implement_path(@implement.id)
    else
      render :edit
    end
  end

  private

  def implement_params
    params.require(:implement).permit(
      :name,
      :superior,
      :implement_group_id,
      implement_property_ids: []
    )
  end
end
