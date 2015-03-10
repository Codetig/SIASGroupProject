class TracksController < ApplicationController
  before_action :find_bucket_id, only: [:create, :destroy]

  def create
    #tr_info = {}
    @track = Track.find_by(spotify_track_id: params[:track][:spotify_track_id]) || Track.new(track_params) #ife-changed this from prams[:tracks]
    @track.buckets << @bucket  #adding track to associated bucket
    
    # #IFE's code
    if @track.save
      redirect_to @bucket, notice: "#{@track.title} has been added"
      # binding.pry
    else
      redirect_to @bucket, notice: "unable to add #{@track.title}"
    end

    #Sue's code
    # respond_to do |format|
    #   if @track.save
    #     format.html { redirect_to @bucket, notice: "#{@track.title} has been added" }
    #     format.html { redirect_to tracks_url }
    #     format.json { head :ok }
    #   else
    #     format.html {redirect_to @bucket, notice: "unable to add #{@track.title}"}
    #     format.json
    #   end
    #   format.js
    #  end    
  end

  #no need to update. need to be deleted? 
  def update
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    respond_to do |format|
      format.html { redirect_to bucket_url(@bucket), notice: "Successfully deleted a song." }
      format.json { head :no_content }
      format.js   { render :nothing => true }
    end

    # redirect_to bucket_path, notice:  "Successfully destroyed post."
  end

  private 
  def find_bucket_id
    @bucket = Bucket.find(params[:bucket_id])
  end
  def track_params
    params.require(:track).permit(:title, :track_uri, :artist, :spotify_track_id) #removed playcount, we don't want user adding it
  end
end
