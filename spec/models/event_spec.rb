require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      event = build(:event, name: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without a description" do
      event = build(:event, description: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without a start date" do
      event = build(:event, start_date: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without an end date" do
      event = build(:event, end_date: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without a start time" do
      event = build(:event, start_time: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without an end time" do
      event = build(:event, end_time: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without a location" do
      event = build(:event, location: nil)

      expect(event).to_not be_valid
    end

    it "is invalid without a zipcode" do
      event = build(:event, zipcode: nil)

      expect(event).to_not be_valid
    end
  end

  describe "Relationships" do
    it "has many groups" do
      event = create(:event)

      expect(event).to respond_to(:groups)

      event = create(:event, :with_groups)

      expect event.groups.count to eq 3
    end

    it "has many interests" do
      event = create(:event)

      expect(event).to respond_to(:interests)

      event = create(:event, :with_interests)

      expect event.interests.count to eq 3
    end
  end

end
