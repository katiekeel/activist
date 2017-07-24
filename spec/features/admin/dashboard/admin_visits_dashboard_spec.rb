require "rails_helper"

describe "Admin visits dashboard page and" do
  scenario "clicks link to see all groups" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    click_link "All Groups"

    expect(current_path).to eq "/admin/groups"
  end

  scenario "clicks link to see all events" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    click_link "All Events"

    expect(current_path).to eq "/admin/events"
  end

  scenario "clicks link to see all users" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    click_link "All Users"

    expect(current_path).to eq "/admin/users"
  end

  scenario "clicks link to see all interests" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    click_link "All Interests"

    expect(current_path).to eq "/admin/interests"
  end

end
