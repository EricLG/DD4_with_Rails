class Admin::UsersController < ApplicationController

  def index
    @hide_side_bloc = true
    @users = User.all.order(:created_at)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to admin_users_path
  end

end
