class Login < ActiveRecord::Base
#   def self.from_omniauth(auth)
#   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|

#      where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.name = auth.info.name
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#     end
#   end
# end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth (auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end