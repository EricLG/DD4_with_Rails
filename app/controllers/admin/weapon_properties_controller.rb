class Admin::WeaponPropertiesController < ApplicationController
  before_action :set_weapon_property, only: %i[show edit update destroy]

  # GET /weapon_properties
  # GET /weapon_properties.json
  def index
    @weapon_properties = WeaponProperty.all.order(:name)
  end

  # GET /weapon_properties/1
  # GET /weapon_properties/1.json
  def show; end

  # GET /weapon_properties/new
  def new
    @weapon_property = WeaponProperty.new
  end

  # GET /weapon_properties/1/edit
  def edit; end

  # POST /weapon_properties
  # POST /weapon_properties.json
  def create
    @weapon_property = WeaponProperty.new(weapon_property_params)

    respond_to do |format|
      if @weapon_property.save
        format.html do
          redirect_to admin_weapon_property_path @weapon_property, notice: 'Weapon property was successfully created.'
        end
        format.json { render :show, status: :created, location: @weapon_property }
      else
        format.html { render :new }
        format.json { render json: @weapon_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapon_properties/1
  # PATCH/PUT /weapon_properties/1.json
  def update
    respond_to do |format|
      if @weapon_property.update(weapon_property_params)
        format.html do
          redirect_to(
            admin_weapon_property_path(@weapon_property),
            notice: 'Weapon property was successfully updated.'
          )
        end
        format.json { render :show, status: :ok, location: @weapon_property }
      else
        format.html { render :edit }
        format.json { render json: @weapon_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_properties/1
  # DELETE /weapon_properties/1.json
  def destroy
    @weapon_property.destroy
    respond_to do |format|
      format.html { redirect_to admin_weapon_properties_url, notice: 'Weapon property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weapon_property
    @weapon_property = WeaponProperty.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def weapon_property_params
    params.require(:weapon_property).permit(
      :name,
      :description
    )
  end
end
