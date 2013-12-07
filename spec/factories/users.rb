# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    username "MyString"
    email "MyString"
    password_digest "MyString"
  end
end
