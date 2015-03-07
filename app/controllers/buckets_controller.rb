class BucketsController < ApplicationController
  # before_action :check_login

  def index
    @user = User.find(params[:user_id])
    @buckets = @user.buckets
  end

  def update
    @bucket = Bucket.find(params[:id])
    @user = @bucket.user
    if @bucket.update_attributes bucket_params
      redirect_to :back, notice: "Bucket has been updated"
    else
      redirect_to :back, notice: "Invalid name or description entry"
    end
  end

  def show
  end

private

def check_login
  if session[user_id] == nil
    redirect_to root_path, notice: "Please log in"
  end
end

def bucket_params
  params.require(:bucket).permit(:name, :desc, :image)
end

end
