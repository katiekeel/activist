require "rails_helper"

describe "User is a contact and" do
  scenario "creates an event" do
    contact = create(:user, role: 2)
    group = create(:group, contact: contact)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    visit contact_events_path

    click_link "Create New Event"

    expect(current_path).to eq "/contact/events/new"

    fill_in "event[name]", with: "New Event"
    fill_in "event[description]", with: "New event description"
    fill_in "event[start_date]", with: "2017-04-18"
    fill_in "event[end_date]", with: "2017-04-18"
    fill_in "event[start_time]", with: "01:00 PM"
    fill_in "event[end_time]", with: "02:00 PM"
    fill_in "event[location]", with: "Denver"
    fill_in "event[zipcode]", with: 23456
    select "#{group.name}", from: "event_group_ids"

    click_button "Create Event"

    expect(current_path).to eq "/contact/events"
    expect(page).to have_content "New Event"
  end
end
