class Admin::ImplementPropertiesController < ApplicationController
  layout 'no_sidebloc'
  before_action :set_implement_property, only: %i[show edit update destroy]

  # GET /implement_properties
  # GET /implement_properties.json
  def index
    @implement_properties = ImplementProperty.all.order(:name)
  end

  # GET /implement_properties/1
  # GET /implement_properties/1.json
  def show; end

  # GET /implement_properties/new
  def new
    @implement_property = ImplementProperty.new
  end

  # GET /implement_properties/1/edit
  def edit; end

  # POST /implement_properties
  # POST /implement_properties.json
  def create
    @implement_property = ImplementProperty.new(implement_property_params)

    respond_to do |format|
      if @implement_property.save
        format.html do
          redirect_to admin_implement_property_path @implement_property, notice: 'implement property was successfully created.'
        end
        format.json { render :show, status: :created, location: @implement_property }
      else
        format.html { render :new }
        format.json { render json: @implement_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /implement_properties/1
  # PATCH/PUT /implement_properties/1.json
  def update
    respond_to do |format|
      if @implement_property.update(implement_property_params)
        format.html do
          redirect_to(
            admin_implement_property_path(@implement_property),
            notice: 'implement property was successfully updated.'
          )
        end
        format.json { render :show, status: :ok, location: @implement_property }
      else
        format.html { render :edit }
        format.json { render json: @implement_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implement_properties/1
  # DELETE /implement_properties/1.json
  def destroy
    @implement_property.destroy
    respond_to do |format|
      format.html { redirect_to admin_implement_properties_url, notice: 'implement property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_implement_property
    @implement_property = ImplementProperty.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def implement_property_params
    params.require(:implement_property).permit(
      :name,
      :description
    )
  end
end
