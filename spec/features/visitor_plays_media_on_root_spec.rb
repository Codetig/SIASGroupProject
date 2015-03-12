require "rails_helper"

feature "Visitor plays media on root/site-index" do
  
  scenario "clicks on happy-bucket play-link" do
    #setup
    visit root_path

    #exercise
    page.first("#happy").click
    
    #verify
    expect(find("#happy")[:class] == "glyphicon glyphicon-play-circle circleplay").to be true 
  end

  scenario "clicks on edgy-bucket play-link" do
    #setup
    visit root_path

    #exercise
    find("#edgy").click
    
    #verify
    expect(find('#edgy')[:class] == "glyphicon glyphicon-play-circle circleplay ").to be true
  end

  scenario "clicks on nostalgic-bucket play-link" do
    #setup
    visit root_path

    #exercise
    find("#nost").click
    
    #verify
    expect(find('#nost')[:class] == "glyphicon glyphicon-play-circle circleplay ").to be true
  end
end