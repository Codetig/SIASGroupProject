class TracksController < ApplicationController
  def create
    @track = Track.new(params[:track])
    binding.pry
    respond_to do |format|
      if @track.save
        format.html { redirect_to tracks_url }
        format.json { head :ok }
      else
        format.html
        format.json
      end
      format.js
    end
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
    params.require(:track).permit(:title, :uri, :artist, :spotify_track_id, :play_count)
  end
end
