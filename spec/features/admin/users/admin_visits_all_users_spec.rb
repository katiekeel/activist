require "rails_helper"

describe "User visits users index page" do
  context "as admin and" do
    it "sees all users" do
      admin = create(:user, role: 1)
      user = create(:user, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content(user.name)
    end

    it "clicks link to create a user" do
      user = create(:user)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_link "Create New User"

      expect(current_path).to eq "/admin/users/new"
    end

    it "clicks link to edit an user" do
      user = create(:user)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_link "Edit"

      expect(current_path).to eq "/admin/users/#{user.id}/edit"
    end

    it "clicks link to delete an user" do
      user = create(:user)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      click_link "Delete"

      expect(current_path).to eq "/admin/users"

      expect(page).to_not have_content "#{user.name}"
    end
  end
end
