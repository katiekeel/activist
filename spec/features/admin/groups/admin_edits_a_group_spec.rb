require "rails_helper"

describe "User is an admin and" do
  scenario "edits a group" do
    group = create(:group)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_groups_path

    click_link "Edit"

    expect(current_path).to eq "/admin/groups/#{group.id}/edit"

    fill_in "group[name]", with: "Edited Group"

    click_button "Update Group"

    expect(current_path).to eq "/admin/groups"
    expect(page).to have_content "Edited Group"
  end
end
