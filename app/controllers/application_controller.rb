class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_current_logged_user

  def check_current_logged_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => error
      flash['error'] = error.message
      session[:user_id] = nil
      redirect_to '/login'
    end
  end

  def authorize
    redirect_to '/login' unless @current_user
  end

  def authorize_admin
    redirect_to '/login' unless %w[illisae ashera].include? @current_user.try(:name).try(:downcase)
  end

end
