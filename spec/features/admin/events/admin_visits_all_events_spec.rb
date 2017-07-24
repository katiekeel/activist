require "rails_helper"

describe "User visits events index page" do
  context "as admin and" do
    it "sees all events" do
      event = create(:event)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_events_path
      expect(page).to have_content(event.name)
    end

    it "clicks link to create an event" do
      event = create(:event)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_events_path

      click_link "Create New Event"

      expect(current_path).to eq "/admin/events/new"
    end

    it "clicks link to edit an event" do
      event = create(:event)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_events_path

      click_link "Edit"

      expect(current_path).to eq "/admin/events/#{event.id}/edit"
    end

    it "clicks link to delete an event" do
      event = create(:event)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_events_path

      click_link "Delete"

      expect(current_path).to eq "/admin/events"

      expect(page).to_not have_content "#{event.name}"
    end
  end
end
