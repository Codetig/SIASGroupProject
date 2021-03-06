class BucketsController < ApplicationController
  before_action :check_login, :require_user

  def index
    @user = User.find(params[:user_id])
    # binding.pry
    redirect_to root_path notice: "permission denied" unless @user.id == session[:user_id]
    unless @user.first_name
    @user.first_name = @user.name.split(" ")[0]
    @user.last_name = @user.name.split(" ")[1]
    end
    @buckets = @user.buckets.order(name: :asc)
    # @tracks = @bucket.tracks
    # @playlist = @tracks.map {|track| track.spotify_track_id} if @tracks.any?
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

    @bucket = Bucket.find params[:id]
    @tracks = @bucket.tracks.order(play_count: :desc)
    @user = @bucket.user
    redirect_to root_path notice: "permission denied" unless @user.id == session[:user_id]
    unless @user.first_name
    @user.first_name = @user.name.split(" ")[0]
    @user.last_name = @user.name.split(" ")[1]
    end
    @playlist = @tracks.map {|track| track.spotify_track_id} if @tracks.any?
  end


  def create
    @bucket = Bucket.new bucket_params
    @user = User.find(params[:user_id])
    @bucket.user = @user
    if @bucket.save
      redirect_to :back, notice: "New bucket created. Click bucket name to add songs"
    else
      redirect_to :back, notice: "No bucket was created: A bucket must have a name"
    end
  end

  def destroy
    bucket = Bucket.find(params[:id])
    bucket.destroy
    redirect_to :back, notice: "#{bucket.name} Bucket deleted"
  end

private

def check_login
  if session[:user_id] == nil
    redirect_to root_path, notice: "Please log in"
  end
end

def bucket_params
  params.require(:bucket).permit(:name, :desc, :image)
end

end
