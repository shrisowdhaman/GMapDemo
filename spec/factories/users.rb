# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login 'shrisowdhaman'
    email 'shrisowdhaman.s@kggroup.com'
    password 'kggroup'
    password_confirmation 'kggroup'
  end 
end