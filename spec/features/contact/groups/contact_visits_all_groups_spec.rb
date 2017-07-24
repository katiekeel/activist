require "rails_helper"

describe "User visits groups index page" do
  context "as contact and" do
    it "sees all groups" do
      contact = create(:user, role: 2)
      group = create(:group, contact: contact)
      contact.groups << group

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      visit contact_groups_path

      expect(page).to have_content(group.name)
    end

    it "clicks link to create a group" do
      contact = create(:user, role: 2)
      group = create(:group, contact: contact)
      contact.groups << group

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      visit contact_groups_path

      click_link "Create New Group"

      expect(current_path).to eq "/contact/groups/new"
    end

    it "clicks link to edit an group" do
      contact = create(:user, role: 2)
      group = create(:group, contact: contact)
      contact.groups << group

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      visit contact_groups_path

      click_link "Edit"

      expect(current_path).to eq "/contact/groups/#{group.id}/edit"
    end

    it "clicks link to delete an group" do
      contact = create(:user, role: 2)
      group = create(:group, contact: contact)
      contact.groups << group

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(contact)

      visit contact_groups_path

      click_link "Delete"

      expect(current_path).to eq "/contact/groups"

      expect(page).to_not have_content "#{group.name}"
    end
  end
end
