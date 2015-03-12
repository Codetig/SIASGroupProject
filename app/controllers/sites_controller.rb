class SitesController < ApplicationController
  def index
    if session[:user_id] != nil
      user_id = session[:user_id]
      @user = User.find(user_id)
      redirect_to user_buckets_path(@user)
    end
  end

  def about_project
  end

  def guest_login
    binding.pry
    @user = User.find(1)
    session[:user_id] = @user.id
    redirect_to user_buckets_path(@user)
  end

end 