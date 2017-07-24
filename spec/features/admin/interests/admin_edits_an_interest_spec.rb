require "rails_helper"

describe "User is an admin and" do
  scenario "edits an interest" do
    interest = create(:interest)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_interests_path

    click_link "Edit"

    expect(current_path).to eq "/admin/interests/#{interest.id}/edit"

    fill_in "interest[name]", with: "Edited Interest"

    click_button "Update Interest"

    expect(current_path).to eq "/admin/interests"
    expect(page).to have_content "Edited Interest"
  end
end
