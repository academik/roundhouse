class SessionsController < ApplicationController

def new 
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    elsif user
      flash.now[:danger] = 'Invalid password'
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end	
end # --- create --- 

def destroy
	sign_out
	redirect_to root_url
end # --- destroy --- 

end
