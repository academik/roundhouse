# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poem do
    venue_id 1
    organization_id 1
    title "MyString"
    date "2013-12-06"
    text "MyText"
    city "MyString"
    state "MyString"
    country "MyString"
  end
end
