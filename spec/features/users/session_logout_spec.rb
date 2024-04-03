require "rails_helper"

RSpec.describe "session logout", type: :feature do
  describe "As a user" do
    it "User can log out" do
      user = User.create(name: "User One", email: "user1@test.com", password: "tests", password_confirmation: "tests")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      click_button("Log Out")

      expect(current_path).to eq(root_path)
    end
  end 
end