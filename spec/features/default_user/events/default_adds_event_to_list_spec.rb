require 'rails_helper'

describe "Default user visits all events" do
  scenario "and adds an event to their list" do
    default_user = create(:user, role: 0)
    event = create(:event)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit events_path

    click_link "#{event.name}"

    expect(current_path).to eq "/events/#{event.id}"

    click_link "Add to Your Events"

    expect(current_path).to eq "/default_user/events"

    expect(page).to have_content "#{event.name}"
  end
end
