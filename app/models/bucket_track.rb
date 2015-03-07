class BucketTrack < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :track

  validates :bucket_id, uniqueness: {scope: :track_id}
   
end
