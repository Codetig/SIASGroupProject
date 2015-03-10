class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  # @user = User.from_omniauth(env["omniauth.auth"])

def require_user
  redirect_to user_buckets_path(current_user) unless current_user
end

  protect_from_forgery with: :exception

  private

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]

  # rescue ActiveRecord::RecordNotFound
  end
  
  helper_method :current_user
end
