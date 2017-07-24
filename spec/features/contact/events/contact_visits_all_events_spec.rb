require "rails_helper"

describe "User visits events index page" do
  context "as contact and" do
    it "sees all events" do
      contact = create(:user, role: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      group = create(:group, contact: contact)
      event = create(:event)
      event.groups << group
      contact.events << event

      visit contact_events_path

      expect(page).to have_content(event.name)
    end

    it "clicks link to create an event" do
      contact = create(:user, role: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      group = create(:group, contact: contact)
      event = create(:event)
      event.groups << group
      contact.events << event


      visit contact_events_path

      click_link "Create New Event"

      expect(current_path).to eq "/contact/events/new"
    end

    it "clicks link to edit an event" do
      contact = create(:user, role: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      group = create(:group, contact: contact)
      event = create(:event)
      event.groups << group
      contact.events << event


      visit contact_events_path

      click_link "Edit"

      expect(current_path).to eq "/contact/events/#{event.id}/edit"
    end

    it "clicks link to delete an event" do
      contact = create(:user, role: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      group = create(:group, contact: contact)
      event = create(:event)
      event.groups << group
      contact.events << event

      visit contact_events_path

      click_link "Delete"

      expect(current_path).to eq "/contact/events"

      expect(page).to_not have_content "#{event.name}"
    end
  end
end
