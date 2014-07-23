# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :comment do
    commenter "Test 123"
    body "test12"
    association :post, :factory =>:post
  end
  
end
