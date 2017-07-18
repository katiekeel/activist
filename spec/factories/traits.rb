FactoryGirl.define do
  trait :with_groups do
    transient do
      group_count 3
    end

    after(:create) do |object, evaluator|
      object.groups << create_list(:group, evaluator.group_count)
    end
  end

  trait :with_interests do
    transient do
      interest_count 3
    end

    after(:create) do |object, evaluator|
      object.interests << create_list(:interest, evaluator.interest_count)
    end
  end

  trait :with_events do
    transient do
      event_count 3
    end

    after(:create) do |object, evaluator|
      object.events << create_list(:event, evaluator.event_count)
    end
  end
end
