class SitesController < ApplicationController
  def index
    if session[:user_id] != nil
      user_id = session[:user_id]
      @user = User.find(user_id)
      redirect_to user_buckets_path(@user)
    end
  end
end 