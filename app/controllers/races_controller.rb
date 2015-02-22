class RacesController < ApplicationController

  def index
    @races =["Changelin","Cristallien","Demi-elfe","Demi-orque","Deva","Drakeide","Drow","Eladrin","Elfe","Feral","Forgelier","Genasi","Githzerai","Gnome","Goliath","Halfelin","Humain","Kalashtar","Minotaure","Nain","Sylvien","Tieffelin"]
  end

end
