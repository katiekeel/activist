FactoryGirl.define do
  factory :event do
    sequence :name do |i|
      "Event #{i}"
    end

    sequence :description do |i|
      "Description #{i}"
    end

    sequence :start_date do |i|
      "2017-05-16"
    end

    sequence :end_date do |i|
      "2017-05-17"
    end

    sequence :start_time do |i|
      "2:0#{i} PM"
    end

    sequence :end_time do |i|
      "3:0#{i} PM"
    end

    sequence :location do |i|
      "Location #{i}"
    end

    sequence :zipcode do |i|
      "1234#{i}"
    end
  end
end
