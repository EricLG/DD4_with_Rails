class RacesController < ApplicationController

  def index
    @races = Race.select(:id, :name).all
  end

  def show
    @race = Race.includes(:race_features, :source).find_by_id(params[:id])
  end

end
