class RacesController < ApplicationController
  layout 'no_sidebloc', only: :index

  def index
    @races = Race.select(:id, :name).all

    respond_to do |format|
      format.html {render :index}
      format.json {render json: {races: @races}}
    end
  end

  def show
    @races = Race.select(:id, :name).all
    @race = Race.includes(:skill, :features, :source).find_by_id(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: {
        races: @races,
        #race: @race.to_json(include: [:source, :skill, :features]),
        race: @race.as_json(include: [:source, :skill, :features])
      }}
    end
  end
end
