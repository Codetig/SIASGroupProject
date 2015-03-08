class BucketsController < ApplicationController
  # before_action :check_login

  def index
    @user = User.find(params[:user_id])
    @buckets = @user.buckets
  end

  def show
    @bucket = Bucket.find params[:id]
    @tracks = @bucket.tracks

    # if params.key? :search_term
    #   request = Typhoeus::Request.new(
    #     "https://api.spotify.com/v1/search?q="+params[:search_term].to_s+"&type=track,artist&market=US"
    #     # ,
    #     # method: :get,
    #     # params: {q: params[:search_term]}
    #   )
    #   request.run
    #   @search_results = JSON.parse(request.response.body)
    #   # binding.pry
    # end

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json {render :json => @search_results}
    # end
    # @search_results
  end

  private

  # def check_login
  #   if session[user_id] == nil
  #     redirect_to root_path, notice: "Please log in"
  #   end
  # end

  def bucket_params
    params.require(:bucket).permit(:name, :desc, :image)
  end

end
