module SessionsHelper

	def sign_in(user)
		#create a new token
		remember_token = User.new_remember_token
		#place the unencrypted token into a cookie
		cookies.permanent[:remember_token] = remember_token
		#save the encrypted token to the database
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		#set the current user to the given user
		self.current_user = user
	end # --- sign_in --- 

	def signed_in?
		# returns true if current_user is set (a user is signed in)
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end # --- def sign_out --- 

	def current_user=(user)
		# self.current_user is automatically converted to current_user=()
		#(user) is the user to be signed in
		# effectively stores the user for later use
		@current_user = user
	end

	def current_user
		#encrypts the remember_token in cookies, and then finds the corresponding
		#match in the database if the @current_user variable is empty. 
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

end

