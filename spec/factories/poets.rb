# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poet do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    website "MyString"
    bio "MyText"
    facebook "MyString"
    twitter "MyString"
  end
end
