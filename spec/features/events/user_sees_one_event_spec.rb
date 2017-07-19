require 'rails_helper'

describe "User sees one interest" do
  scenario "and clicks link to its first group" do
    interest = create(:interest, :with_groups)

    visit "/interests/#{interest.id}"

    click_link "#{interest.groups.first.name}"

    expect(current_path).to eq "/groups/#{interest.groups.first.id}"
  end

  scenario "and clicks link to its first event" do
    interest = create(:interest, :with_events)

    visit "/interests/#{interest.id}"

    click_link "#{interest.events.first.name}"

    expect(current_path).to eq "/events/#{interest.events.first.id}"
  end
end
