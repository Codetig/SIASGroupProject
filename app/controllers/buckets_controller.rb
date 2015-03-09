class BucketsController < ApplicationController
  # before_action :check_login

  def index
    @user = User.find(9)
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
#Sue's work on show is below(from merge)
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

  def create
    @bucket = Bucket.new bucket_params
    @user = User.find(params[:user_id])
    @bucket.user = @user
    if @bucket.save
      redirect_to :back, notice: "New bucket created"
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
  if session[user_id] == nil
    redirect_to root_path, notice: "Please log in"
  end
end

def bucket_params
  params.require(:bucket).permit(:name, :desc, :image)
end

end
