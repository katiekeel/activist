require "rails_helper"

describe "User visits groups index page" do
  context "as admin and" do
    it "sees all groups" do
      group = create(:group)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_groups_path
      expect(page).to have_content(Group.first.name)
    end

    it "clicks link to create an group" do
      group = create(:group)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_groups_path

      click_link "Create New Group"

      expect(current_path).to eq "/admin/groups/new"
    end

    it "clicks link to edit an group" do
      group = create(:group)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_groups_path

      click_link "Edit"

      expect(current_path).to eq "/admin/groups/#{group.id}/edit"
    end

    it "clicks link to delete an group" do
      group = create(:group)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_groups_path

      click_link "Delete"

      expect(current_path).to eq "/admin/groups"

      expect(page).to_not have_content "#{group.name}"
    end
  end
end
