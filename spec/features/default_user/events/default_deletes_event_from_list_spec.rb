require 'rails_helper'

describe "Default user has events on their list and" do
  scenario "deletes an event from their list" do
    default_user = create(:user, :with_events)
    event = default_user.events.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit default_user_events_path

    first(:link, "Delete").click

    expect(current_path).to eq "/default_user/events"
    expect(page).to_not have_content "#{event.name}"
  end
end
