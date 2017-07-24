require "rails_helper"

describe "User is an admin and" do
  scenario "creates a group" do
    group = create(:group)
    admin = create(:user, role: 1)
    contact = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_groups_path

    click_link "Create New Group"

    expect(current_path).to eq "/admin/groups/new"

    fill_in "group[name]", with: "New Group"
    fill_in "group[description]", with: "New group description"
    select "#{contact.name}", from: "group_contact_id"

    click_button "Create Group"

    expect(current_path).to eq "/admin/groups"
    expect(page).to have_content "New Group"
  end
end
