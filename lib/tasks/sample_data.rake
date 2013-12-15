namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		#make_users
		make_poems
		make_poets
	end
end

def make_users
	admin = User.create!(username: 			"Andrew K",
						 email: 		"andrew@gmail.com",
						 password: 		"foobar",
						 password_confirmation: "foobar",
						 admin:true)

	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(username: name,
					 email: email,
					 password: password,
					 password_confirmation: password)
	end
end # --- 99.times do |n| ---

def make_poems
	50.times do
		title = Faker::Lorem.sentence(5)
		link = Faker::Internet.url
		poet = rand(50)
		Poem.create!(title: title,
					link: link,
					poet_id: poet) 
	end #--- 50.times do --- 
end

def make_poets
	50.times do
		first_name = Faker::Name.first_name 
		last_name = Faker::Name.last_name
		website = Faker::Internet.url
		Poet.create!(first_name: first_name,
						last_name: last_name,
						website: website)  
	end
end #make_poets