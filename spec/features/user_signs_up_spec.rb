require 'rails_helper'

feature 'User logs in ' do 
  scenario 'logged in' do
  visit root_path
  click_button "Log in with facebook"
  
  end
end

  before(:each) do
    valid_facebook_login_setup
    get "auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should redirect to root" do
    expect(response).to redirect_to root_path
  end
end

describe "GET '/auth/failure'" do

  it "should redirect to root" do
    get "/auth/failure"
    expect(response).to redirect_to root_path
  end
end