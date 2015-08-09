class ConsumablesController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit]
  before_filter :set_consumable, only: [:show, :edit, :update, :destroy]

  def index
    @consumables = Consumable.all.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
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
        format.html { redirect_to object_consumable_path(@consumable), notice: 'Consumable was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to object_consumable_path(@consumable), notice: 'Consumable was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to object_consumables_path, notice: 'Consumable was successfully destroyed.' }
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
