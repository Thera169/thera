FactoryGirl.define do
  factory :user do
    name "Harry Potter"
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "icecream"
    password_confirmation "icecream"
  end
end
