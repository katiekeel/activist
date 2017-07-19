require 'rails_helper'

describe "User sees one group" do
  scenario "and clicks link to its first event" do
    group = create(:group, :with_events)

    visit "/groups/#{group.id}"

    click_link "#{group.events.first.name}"

    expect(current_path).to eq "/events/#{group.events.first.id}"
  end

  scenario "and sees its interests" do
    group = create(:group, :with_interests)

    visit "/groups/#{group.id}"

    click_link "#{group.interests.first.name}"

    expect(current_path).to eq "/interests/#{group.interests.first.id}"
  end
end
