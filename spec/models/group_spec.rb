require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      group = build(:group, name: nil)

      expect(group).to_not be_valid
    end

    it "is invalid without a description" do
      group = build(:group, description: nil)

      expect(group).to_not be_valid
    end

    it "is invalid without a contact" do
      group = build(:group, contact: nil)

      expect(group).to_not be_valid
    end
  end

  describe "Relationships" do
    it "has many interests" do
      group = create(:group)

      expect(group).to respond_to(:interests)

      group = create(:group, :with_interests)

      expect(group.interests.count).to eq 3
    end

    it "has many interests" do
      group = create(:group)

      expect(group).to respond_to(:events)

      group = create(:group, :with_events)

      expect(group.events.count).to eq 3
    end
  end

end
