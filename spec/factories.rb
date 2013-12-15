FactoryGirl.define do
  factory :user do
    sequence(:name)  	{ |n| "Person #{n}" }
    sequence(:username)	{ |n| "Username#{n}"}
    sequence(:email) 	{ |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :poet do
  	sequence(:first_name)  	{ |n| "Person #{n}" }
    sequence(:last_name)	{ |n| "Username#{n}"}
    sequence(:email) 		{ |n| "person_#{n}@example.com"}
    sequence(:website) 		{ |n| "www.ytmnd.com"}
    sequence(:twitter) 		{ |n| "twitter"}
    sequence(:tumblr) 		{ |n| " "}
    sequence(:facebook) 	{ |n| "faces"}
    sequence(:youtube) 		{ |n| "johndoe"}
  end

end