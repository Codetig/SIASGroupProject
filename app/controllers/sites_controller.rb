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
    @user = User.find_by(name: "Guest User") || User.create(name: "Guest User", first_name: "Guest", last_name: "User", uid: 111222333, email: "visitor@site.com")
    session[:user_id] = @user.id
    redirect_to user_buckets_path(@user)
  end

end 