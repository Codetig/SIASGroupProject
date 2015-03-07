class Bucket < ActiveRecord::Base
  has_many :bucket_tracks, dependent: :destroy
  has_many :tracks, through: :bucket_tracks
  belongs_to :user

  validates :name, presence: true
end
