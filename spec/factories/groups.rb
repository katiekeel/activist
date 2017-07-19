FactoryGirl.define do
  factory :group do
    sequence :name do |i|
      "Group #{i}"
    end

    sequence :description do |i|
      "Description #{i}"
    end

    contact
  end
end
