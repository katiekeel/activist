require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      user = build(:user, name: nil)

      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)

      expect(user).to_not be_valid
    end
  end

  describe "Relationships" do
    it "has many groups" do
      user = create(:user)

      expect(user).to respond_to(:groups)

      user = create(:user, :with_groups)

      expect(user.groups.count).to eq 3
    end

    it "has many events" do
      user = create(:user)

      expect(user).to respond_to(:events)

      user = create(:user, :with_events)

      expect(user.events.count).to eq 3
    end

    it "has many interests" do
      user = create(:user)

      expect(user).to respond_to(:interests)

      user = create(:user, :with_interests)

      expect(user.interests.count).to eq 3
    end
  end
end
