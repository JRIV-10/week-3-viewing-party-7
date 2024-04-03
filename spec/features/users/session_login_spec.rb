require "rails_helper"

RSpec.describe "sessions challenge", type: :feature do
  describe "As a user" do
    it "keeps the user logged in when living a website" do
      user = User.create(name: "User One", email: "user1@test.com", password: "tests", password_confirmation: "tests")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://gist.github.com/cjsim89/dc18707704810665cdbc1492c1a55c9b")
        .to_return(status: 200)
      
      visit user_path(user.id)
      
      expect(page).to have_content("User One's Dashboard")
    end
  end 
end