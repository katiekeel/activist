require "rails_helper"

describe "User is a contact and" do
  it "creates a group" do
    contact = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    group = create(:group, contact: contact)

    visit contact_groups_path

    click_link "Create New Group"

    expect(current_path).to eq "/contact/groups/new"

    fill_in "group[name]", with: "New Group"
    fill_in "group[description]", with: "New group description"

    click_button "Create Group"

    expect(current_path).to eq "/contact/groups"
    expect(page).to have_content "New Group"
  end
end
