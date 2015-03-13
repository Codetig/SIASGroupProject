require "rails_helper"
#need the selenium gem to make this work
feature "Visitor plays media on root/site-index" do
  
  scenario "clicks on happy-bucket play-link", :js => true do
    #setup
    visit root_path

    #exercise
    page.first("#happy").click
    
    #verify
    expect(find("#happy")[:class] == "glyphicon glyphicon-pause circleplay").to be true 
  end

  scenario "clicks on edgy-bucket play-link", :js => true do
    #setup
    visit root_path

    #exercise
    find("#edgy").click
    
    #verify
    expect(find('#edgy')[:class] == "glyphicon glyphicon-pause circleplay ").to be true
  end

  scenario "clicks on nostalgic-bucket play-link", :js => true do
    #setup
    visit root_path

    #exercise
    find("#nost").click
    
    #verify
    expect(find('#nost')[:class] == "glyphicon glyphicon-pause circleplay ").to be true
  end
end