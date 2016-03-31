FactoryGirl.define do
    factory :user do
        name FFaker::Name.name
        email FFaker::Internet.email
        password FFaker::Name.name
    end 
    
    #To use traits, in an rspec file do "create(:user, :survivor)" to create a survivor.
    #Do this instead of create(:user, role_id: '1', name: 'Jasmine Lee',email: 'Jasmine@example.com' )
    
    trait :survivor do 
        role_id 1
    end 
    
    trait :volunteer do 
        role_id 2
    end 
    
    trait :admin do 
        role_id 3
    end 

end