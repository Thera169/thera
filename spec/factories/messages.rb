FactoryGirl.define do
  factory :message do
    conversation
    body "something"
    user
  end
end
