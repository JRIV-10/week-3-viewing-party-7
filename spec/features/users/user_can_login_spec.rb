require "rails_helper"

RSpec.describe "user login", type: :feature do
  describe "As a User" do
    before do
      @user_1 = User.create(name: "User One", email: "user1@test.com", password: "tests", password_confirmation: "tests")
  end

    it "allows a user to login" do
      # When I visit the landing page `/`
      visit root_path
      # I see a link for "Log In"
      # When I click on "Log In"
      click_on("Log In")
      # I'm taken to a Log In page ('/login') where I can input my unique email and password.
      expect(current_path).to eq(login_path)
      # When I enter my unique email and correct password 
      fill_in(:email, with: "user1@test.com")
      fill_in(:password, with: "tests")
      click_on("Log In")
      # I'm taken to my dashboard page
      expect(current_path).to eq(user_path(@user_1))
    end 

    it "errors on invalid credentials" do 
      # When I visit the landing page `/`
      visit root_path
      # And click on the link to go to my dashboard
      click_on("Log In")
      # And fail to fill in my correct credentials 
      fill_in(:email, with: "user1@test.com")
      fill_in(:password, with: "tes")
      click_on("Log In")
      # I'm taken back to the Log In page
      expect(current_path).to eq(login_path)
      # And I can see a flash message telling me that I entered incorrect credentials.
      expect(page).to have_content("Sorry, your credentials are bad.")
    end
  end
end