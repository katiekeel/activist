require 'rails_helper'

describe "Default user vists all events" do
  scenario "and clicks link to first event" do
    default_user = create(:user, role: 0)
    events = create_list(:event, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit events_path

    click_link("#{events.first.name}")

    expect(current_path).to eq "/events/#{events.first.id}"
  end

  context "and clicks link to first event" do
    it "and is denied access because they are not a contact" do
      default_user = create(:user, role: 0)
      events = create_list(:event, 3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit events_path

      click_link "Create New Event"

      expect(current_path).to eq "/login"
      expect(page).to have_content "Please log in as a contact to update groups or events."
    end
  end
end
