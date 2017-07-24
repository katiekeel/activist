require "rails_helper"

describe "Default user visits dashboard page and" do
  scenario "clicks link to see their groups" do
    default_user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit default_user_dashboard_index_path

    click_link "Your Groups"

    expect(current_path).to eq "/default_user/groups"
  end

  scenario "clicks link to see their events" do
    default_user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit default_user_dashboard_index_path

    click_link "Your Events"

    expect(current_path).to eq "/default_user/events"
  end

  scenario "clicks link to see their interests" do
    default_user = create(:user, role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit default_user_dashboard_index_path

    click_link "Your Interests"

    expect(current_path).to eq "/default_user/interests"
  end
end
