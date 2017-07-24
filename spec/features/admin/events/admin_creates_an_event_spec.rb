require "rails_helper"

describe "User is an admin and" do
  scenario "creates an event" do
    event = create(:event)
    admin = create(:user, role: 1)
    group = create(:group)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_events_path

    click_link "Create New Event"

    expect(current_path).to eq "/admin/events/new"

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

    expect(current_path).to eq "/admin/events"
    expect(page).to have_content "New Event"
  end
end
