class RacesController < ApplicationController

  def index
    @hide_side_bloc = true
    @races = Race.select(:id, :name).all
  end

  def show
    @races = Race.select(:id, :name).all
    @race = Race.includes(:features, :source).find_by_id(params[:id])
    @name = @race.name.mb_chars.downcase.gsub(/[Éé]/, 'e').gsub(/[\s]/, '_')
  end

end
