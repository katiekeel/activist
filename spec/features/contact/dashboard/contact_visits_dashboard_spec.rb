require "rails_helper"

describe "Contact visits dashboard page and" do
  scenario "clicks link to see their groups" do
    contact = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    visit contact_dashboard_index_path

    click_link "Your Groups"

    expect(current_path).to eq "/contact/groups"
  end

  scenario "clicks link to see their events" do
    contact = create(:user, role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

    visit contact_dashboard_index_path

    click_link "Your Events"

    expect(current_path).to eq "/contact/events"
  end
end
