require 'rails_helper'

describe "User visits all groups" do
  scenario "and sees their names" do
    group = create(:group)

    visit groups_path

    expect(page).to have_link(group.name)
  end

  scenario "and clicks link to see a group" do
    group = create(:group)

    visit groups_path

    click_link "#{group.name}"

    expect(current_path).to eq "/groups/#{group.id}"
  end
end
