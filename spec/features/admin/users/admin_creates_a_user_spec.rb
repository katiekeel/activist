require "rails_helper"

describe "User is an admin and" do
  scenario "creates a user" do
    user = create(:user)
    admin = create(:user, role: 1)
    contact = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_link "Create New User"

    expect(current_path).to eq "/admin/users/new"

    fill_in "user[name]", with: "newuser"
    fill_in "user[password]", with: "password"
    select "default", from: "user_role"

    click_button "Create User"

    expect(current_path).to eq "/admin/users"
    expect(page).to have_content "newuser"
  end
end
