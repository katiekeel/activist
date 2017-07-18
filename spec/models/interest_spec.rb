require 'rails_helper'

RSpec.describe Interest, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      interest = build(:interest, name: nil)

      expect(interest).to_not be_valid
    end

  describe "Relationships" do
    it "has many groups" do
      interest = create(:interest)

      expect(interest).to respond_to(:groups)

      interest = create(:interest, :with_groups)

      expect interest.groups.count to eq 3
    end

    it "has many groups" do
      interest = create(:interest)

      expect(interest).to respond_to(:groups)

      interest = create(:interest, :with_groups)

      expect interest.groups.count to eq 3
    end
  end

end
