require "rails_helper"

describe "User visits interests index page" do
  context "as admin" do
    it "allows admin to see all interests" do
	   admin = create(:user, role: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interests_path
      expect(page).to have_content("Admin Interests")
    end
  end
end
