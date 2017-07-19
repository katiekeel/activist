FactoryGirl.define do
  factory :user, :aliases => [:contact] do
    sequence :name do |i|
      "Name #{i}"
    end

    sequence :password do |i|
      "password#{i}"
    end
  end
end
