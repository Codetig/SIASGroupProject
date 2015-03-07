class Track < ActiveRecord::Base
  has_many :bucket_tracks, dependent: :destroy 
  has_many :buckets, through: :bucket_tracks

  validates :spotify_track_id, presence: true
end
