class ConsumablesController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit]
  before_filter :set_consumable, only: [:show, :edit, :update, :destroy]

  def index
    @consumables = Consumable.all.paginate(:page => params[:page], :per_page => 2).order(name: :asc)
  end

  def show
  end

  def new
    @consumable = Consumable.new
  end

  def edit
  end

  def create
    @consumable = Consumable.new(consumable_params)

    respond_to do |format|
      if @consumable.save
        if params["add_another"]
          format.html { redirect_to new_object_consumable_path, notice: t('.notice', name: @consumable.name) }
        else
          format.html { redirect_to object_consumable_path(@consumable), notice: t('.notice', name: @consumable.name) }
        end

      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to object_consumable_path(@consumable), notice: t('.notice', name: @consumable.name) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to object_consumables_path, notice: t('.notice', name: @consumable.name) }
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
        {object_level_ids:[]}
      )
    end

    def find_dependancies
      @levels = ObjectLevel.all
      @sources = Source.all
    end
end
