require "rails_helper"

feature "Visitor clicks on the about us link" do
  
  scenario "clicks on here link" do
    #setup
    visit root_path

    #exercise
    click_link "here"

    #verify
    expect(page).to have_content("Team Members")
  end
end