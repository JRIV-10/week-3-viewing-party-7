require "rails_helper"

RSpec.describe "resigter account", type: :feature do
  describe "As a user" do

    it "registration with authentication" do
      visit register_path

      fill_in(:user_name, with: "Random Joe")
      fill_in(:user_email, with: "some@email.com")
      fill_in(:user_password, with: "tests")
      fill_in(:user_password_confirmation, with: "tests")

      click_on("Create New User")

      expect(current_path).to eq(user_path(User.last))
    end 

    it "errors when matching passwords are NOT the same" do 
      visit register_path

      fill_in(:user_name, with: "Random Joe")
      fill_in(:user_email, with: "some@email.com")
      fill_in(:user_password, with: "tests")
      fill_in(:user_password_confirmation, with: "test")

      click_on("Create New User")

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it "errors when email is not unique" do 
      visit register_path

      fill_in(:user_name, with: "Random Joe")
      fill_in(:user_email, with: "some@email.com")
      fill_in(:user_password, with: "tests")
      fill_in(:user_password_confirmation, with: "tests")

      click_on("Create New User")

      expect(current_path).to eq(user_path(User.last))

      visit register_path

      fill_in(:user_name, with: "Random Joe")
      fill_in(:user_email, with: "some@email.com")
      fill_in(:user_password, with: "tests")
      fill_in(:user_password_confirmation, with: "tests")

      expect(current_path).to eq(register_path)
    end
  end
end