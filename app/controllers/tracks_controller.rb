class TracksController < ApplicationController
  

  def create
    #tr_info = {}
    @track = Track.new(track_params) #ife-changed this from prams[:tracks]
    @bucket = Bucket.find(params[:bucket_id])
    @track.buckets << @bucket  #adding track to associated bucket
    # binding.pry
    if @track.save
      redirect_to @bucket, notice: "#{@track.title} has been added"
      # binding.pry
    else
      redirect_to @bucket, notice: "unable to add #{@track.title}"
    end

    # commented out the code below because I am not sure of its function
    # respond_to do |format|
    #   if @track.save
    #     format.html { redirect_to tracks_url }
    #     format.json { head :ok }
    #   else
    #     format.html
    #     format.json
    #   end
    #   format.js
    # end
  end

  def update
    
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    respond_to do |format|
      format.html { redirect_to bucket_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
    # redirect_to bucket_path
  end



  private 
  def track_params
    params.require(:track).permit(:title, :track_uri, :artist, :spotify_track_id) #removed playcount, we don't want user adding it
  end
end
