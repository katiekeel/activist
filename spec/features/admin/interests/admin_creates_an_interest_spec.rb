require "rails_helper"

describe "User is an admin and" do
  scenario "creates an interest" do
    interest = create(:interest)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_interests_path

    click_link "Create New Interest"

    expect(current_path).to eq "/admin/interests/new"

    fill_in "interest[name]", with: "New Interest"

    click_button "Create Interest"

    expect(current_path).to eq "/admin/interests"
    expect(page).to have_content "New Interest"
  end
end
