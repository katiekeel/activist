require "rails_helper"

describe "User is an admin and" do
  scenario "edits an event" do
    event = create(:event)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_events_path

    click_link "Edit"

    expect(current_path).to eq "/admin/events/#{event.id}/edit"

    fill_in "event[name]", with: "Edited Event"

    click_button "Update Event"

    expect(current_path).to eq "/admin/events"
    expect(page).to have_content "Edited Event"
  end
end
