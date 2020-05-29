class WelcomesController < ApplicationController
  layout :no_sidebloc

  def index; end

  def no_sidebloc
    'no_sidebloc' if @current_user
  end
end
