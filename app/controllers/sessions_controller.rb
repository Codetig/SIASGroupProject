class SessionsController < ApplicationController 
  def create

    @user = Login.from_omniauth(env["omniauth.auth"])

    session[:user_id] = @user.id
    redirect_to user_buckets_path(@user)
  end 

  def destroy 
    session[:user_id] = nil
    redirect_to root_path
  end
end