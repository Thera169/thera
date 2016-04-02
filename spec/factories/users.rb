
FactoryGirl.define do
  factory :user, :class => 'User' do
    name "ian"
    email "person0@example.com"
    password '12345678'
    password_confirmation '12345678'
  end
end

FactoryGirl.define do
  factory :admin_role, :class => 'Role' do
    name 'Admin'
  end
end


FactoryGirl.define do
  factory :admin, :class => 'User' do
    name "ian"
    email "person1@example.com"
    password '12345678'
    password_confirmation '12345678'
    role { create(:admin_role) }
  end
end


FactoryGirl.define do
  factory :survivor, :class => 'Role' do
    name 'Survivor'
  end
end