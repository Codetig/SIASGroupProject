class User < ActiveRecord::Base
  has_many :buckets, dependent: :destroy

  # validates :fb_id, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth (auth)
    # create! do |user|
      user = User.new
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]

      if user.save 
        UserMailer.welcome_email(user).deliver_now
        user 
      end 
  end

end
