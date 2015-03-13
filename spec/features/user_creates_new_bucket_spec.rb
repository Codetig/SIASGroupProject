# require "rails_helper"

# feature "User creates a new bucket" do 

#   scenario "create bucket with valid name" do
#     #setup
#     #set user by logging in

#     #excercise
#     click_button "+"
#     fill_in "Name:", with: "Testy"
#     fill_in "Description:", with: "Just testing this"
#     click_button "Add Bucket"

#     #verify
#     expect(page).to have_content("New bucket created")
#     expect(page).to have_content("Testy")
#   end

#   scenario "create bucket with without name" do
#     #setup
#     #set user by logging in

#     #excercise
#     click_button "+"
#     fill_in "Name:", with: ""
#     fill_in "Description:", with: "Just testing this"
#     click_button "Add Bucket"

#     #verify
#     expect(page).to have_content("No bucket was created: A bucket must have a name")
#   end
  
# end