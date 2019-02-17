class UsersController < ApplicationController
  skip_before_filter :check_current_logged_user, only: [:new]

  def new; end

  def show
    @characters = @current_user.characters.order(:name)
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

  def edit
    user = User.find(params[:id])
    return unless user != @current_user

    flash[:error] = "Vous n'êtes pas autorisé à consulter cette page"
    redirect_to user_path(@current_user.id)
  end

  def update
    user = User.find(params[:id])
    if user != @current_user
      flash[:error] = "Vous n'êtes pas autorisé à consulter cette page"
      redirect_to user_path(@current_user.id)
    end
    if @current_user.update(user_params)
      flash[:info] = 'Vos modifications ont été prises en comptes'
      redirect_to user_path(@current_user.id)
    else
      flash[:error] = "Erreur sur les champs suivants: #{@current_user.errors.full_messages}"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
