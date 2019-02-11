class RacesController < ApplicationController
  layout 'no_sidebloc', only: :index

  def index
    @races = Race.select(:id, :name).all
  end

  def show
    @races = Race.select(:id, :name).all
    @race = Race.includes(:features, :source).find_by_id(params[:id])
  end
end
