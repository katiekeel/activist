require "rails_helper"

describe "User visits interests index page" do
  context "as admin and" do
    it "sees all interests" do
      interest = create(:interest)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interests_path
      expect(page).to have_content(Interest.first.name)
    end

    it "clicks link to create an interest" do
      interest = create(:interest)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interests_path

      click_link "Create New Interest"

      expect(current_path).to eq "/admin/interests/new"
    end

    it "clicks link to edit an interest" do
      interest = create(:interest)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interests_path

      click_link "Edit"

      expect(current_path).to eq "/admin/interests/#{interest.id}/edit"
    end

    it "clicks link to delete an interest" do
      interest = create(:interest)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_interests_path

      click_link "Delete"

      expect(current_path).to eq "/admin/interests"

      expect(page).to_not have_content "#{interest.name}"
    end
  end
end
