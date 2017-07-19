require 'rails_helper'

describe "User visits home page and" do
  context "clicks the log in link" do
    scenario "as a default user" do
      user = create(:user)

      expect(user.default?).to be_truthy

      visit '/'

      click_link "Login"

      fill_in "session[name]", with: user.name
      fill_in "session[password]", with: user.password

      click_button "Log in"

      expect(current_path).to eq "/"
      expect(page).to have_content "Successful login"
    end

    scenario "as a contact for a group" do
      user = create(:user, role: 2)

      expect(user.contact?).to be_truthy

      visit '/'

      click_link "Login"

      fill_in "session[name]", with: user.name
      fill_in "session[password]", with: user.password

      click_button "Log in"

      expect(current_path).to eq "/"
      expect(page).to have_content "Successful login"
    end

    scenario "as the admin" do
      user = create(:user, role: 1)

      expect(user.admin?).to be_truthy

      visit '/'

      click_link "Login"

      fill_in "session[name]", with: user.name
      fill_in "session[password]", with: user.password

      click_button "Log in"

      expect(current_path).to eq "/"
      expect(page).to have_content "Successful login"
    end
  end

  context "is logged in already" do
    scenario "clicks the log out link" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      click_link "Logout"

      expect(current_path).to eq "/"
      expect(page).to have_content "Goodbye"
    end
  end
end
