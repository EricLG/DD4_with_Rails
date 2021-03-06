class SessionsController < ApplicationController
  skip_before_action :check_current_logged_user, only: [:new]

  def new; end

  def create
    email = params[:user][:email].try(:downcase)
    user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      flash[:error] = 'Email ou mot de passe incorrecte'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
