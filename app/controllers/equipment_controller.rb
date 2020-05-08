class EquipmentController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = "L'équipement \"#{@equipment.magic_item_id}\" a bien été enregistré."
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@equipment.errors.full_messages}"
    end
    redirect_to items_magic_item_path(@equipment.magic_item_id)
  end

  def update
    @equipment = Equipment.find_by_id(params[:id])
    if @equipment.update(magic_item_params)
      redirect_to items_magic_item_path(@equipment.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@equipment.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @equipment = Equipment.find_by_id(params[:id])
    @equipment.destroy
    redirect_to items_index_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(
      :magic_item_id,
      :character_id,
      :location_id,
      :level
    )
  end
end
