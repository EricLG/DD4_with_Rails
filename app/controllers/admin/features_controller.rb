class Admin::FeaturesController < ApplicationController
  layout 'no_sidebloc'
  before_action :set_feature_property, only: %i[show edit update destroy]

  def index
    @features = Feature.all.order(:name)
  end

  def show; end

  def new
    @feature = Feature.new
  end

  def edit; end

  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        format.html do
          redirect_to admin_feature_path @feature, notice: 'Feature was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html do
          redirect_to admin_feature_path(@feature), notice: 'Feature was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to admin_features_url, notice: 'Feature was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feature_property
    @feature = Feature.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feature_params
    params.require(:feature).permit(
      :name,
      :kind,
      :required,
      :description
    )
  end
end
