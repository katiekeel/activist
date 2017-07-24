require "rails_helper"

describe "User is an contact and" do
  scenario "edits an group" do
    contact = create(:user, role: 2)
    group = create(:group, contact: contact)
    contact.groups << group

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    visit contact_groups_path

    click_link "Edit"

    expect(current_path).to eq "/contact/groups/#{group.id}/edit"

    fill_in "group[name]", with: "Edited Group"

    click_button "Update Group"

    expect(current_path).to eq "/contact/groups"
    expect(page).to have_content "Edited Group"
  end
end
