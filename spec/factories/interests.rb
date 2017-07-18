FactoryGirl.define do
  factory :interest do
    sequence :name do |i|
      "Interest #{i}"
    end
  end
end
