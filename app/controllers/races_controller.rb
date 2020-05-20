class RacesController < ApplicationController
  layout 'no_sidebloc', only: :index

  def index
    @races = Race.select(:id, :name).all.order(:name)
  end

  def show
    @races = Race.select(:id, :name).all.order(:name)
    @race = Race.includes(:features, :source).find_by_id(params[:id])
  end
end
