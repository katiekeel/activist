require "rails_helper"

describe "User is an admin and" do
  scenario "edits a user" do
    user = create(:user)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_link "Edit"

    expect(current_path).to eq "/admin/users/#{user.id}/edit"

    fill_in "user[name]", with: "Edited User"

    click_button "Update User"

    expect(current_path).to eq "/admin/users"
    expect(page).to have_content "Edited User"
  end
end
