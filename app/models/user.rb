class User < ActiveRecord::Base
  has_many :buckets, dependent: :destroy

  validates :fb_id, presence: true, uniqueness: true


end
