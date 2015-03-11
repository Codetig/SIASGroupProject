class UserMailer < ApplicationMailer

  default from: 'welcome@musicbucket.com'

  def welcome_email(user)
    @member = user
    @url = 'http://localhost:3000'
    @greeting = 'Hey'

  # mail(to: recipient, subject: "Here is what we look like")
   mail to: user.email, subject: "Welcome to the Music Bucket!"
  end 

end
