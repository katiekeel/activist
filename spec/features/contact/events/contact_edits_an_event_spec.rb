require "rails_helper"

describe "User is an contact and" do
  scenario "edits an event" do
    contact = create(:user, role: 2)
    group = create(:group, contact: contact)
    event = create(:event)
    event.groups << group
    contact.events << event

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    visit contact_events_path
    
    click_link "Edit"

    expect(current_path).to eq "/contact/events/#{event.id}/edit"

    fill_in "event[name]", with: "Edited Event"

    click_button "Update Event"

    expect(current_path).to eq "/contact/events"
    expect(page).to have_content "Edited Event"
  end
end
