class SitesController < ApplicationController
  def index
    @user = User.find(9)
  end
end
