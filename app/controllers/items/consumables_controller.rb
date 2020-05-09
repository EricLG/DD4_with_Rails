class Items::ConsumablesController < ApplicationController
  before_action :find_dependancies, only: %i[index new edit]
  before_action :set_consumable, only: %i[show edit update destroy]

  def index
    @consumables = Consumable.all.paginate(page: params[:page], per_page: 20).order(name: :asc)
  end

  def show
    @left_level_group, @right_level_group = @consumable.object_levels.order(:level).in_groups(2)
  end

  def new
    @consumable = Consumable.new
  end

  def edit; end

  def create
    @consumable = Consumable.new(consumable_params)

    respond_to do |format|
      if @consumable.save
        if params['add_another']
          format.html { redirect_to new_items_consumable_path, notice: t('.notice', name: @consumable.name) }
        else
          format.html { redirect_to items_consumable_path(@consumable), notice: t('.notice', name: @consumable.name) }
        end
      else
        find_dependancies
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to items_consumable_path(@consumable), notice: t('.notice', name: @consumable.name) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to items_consumables_path, notice: t('.notice', name: @consumable.name) }
    end
  end

  private

  def set_consumable
    @consumable = Consumable.find(params[:id])
  end

  def consumable_params
    params.require(:consumable).permit(
      :name,
      :description,
      :kind,
      :alteration,
      :property,
      :power,
      :special,
      :source_id,
      object_level_ids: []
    )
  end

  def find_dependancies
    @levels = ObjectLevel.all
    @sources = Source.all
  end
end
