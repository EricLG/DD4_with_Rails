class RacesController < ApplicationController

  def index
    #@races =["Changelin","Cristallien","Demi-elfe","Demi-orque","Deva","Drakeide","Drow","Eladrin","Elfe","Feral","Forgelier","Genasi","Githzerai","Gnome","Goliath","Halfelin","Humain","Kalashtar","Minotaure","Nain","Silvyen","Tieffelin"]
    @races = Race.select(:id, :name).all
  end

  def show
    @race = Race.includes(:race_features, :source).find_by_id(params[:id])
  end

end
