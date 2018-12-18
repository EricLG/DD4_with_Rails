class WelcomesController < ApplicationController
  def index
    @hide_side_bloc = true if @current_user
  end
end
