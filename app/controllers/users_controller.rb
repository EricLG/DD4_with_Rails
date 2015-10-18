class UsersController < ApplicationController

  skip_before_filter :check_current_logged_user, only: [:new]

  def new
  end

  def show
    @characters = @current_user.characters
  end

  def create
    user = User.new(user_params)
    user.email = user.email.downcase
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
