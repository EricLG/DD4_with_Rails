class Admin::UsersController < ApplicationController
  def index
    @hide_side_bloc = true
    @users = User.all.order(:created_at)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      flash[:error] = "Erreur sur les champs suivants: #{@user.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
