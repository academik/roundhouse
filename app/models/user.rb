class User < ActiveRecord::Base
	before_save { email.downcase! }
		
	validates :name, 			length: { maximum: 50 } 
	validates :username, 		presence: true, length: { maximum: 20 },
								uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, 			presence: true, 
								format: { with: VALID_EMAIL_REGEX },
								uniqueness: { case_sensitive: false }
	validates :password_digest,	presence: true

	has_secure_password
	validates :password, length: { minimum: 6 }
end