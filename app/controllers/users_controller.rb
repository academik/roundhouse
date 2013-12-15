class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:edit, :update]
  before_action :correct_user,    only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user 
      flash[:success] = "Welcome to the Roundhouse Poetry!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params) #prevent mass-assignment
      flash[:success] = "Profile updated"
      redirect_to @user 
    else
      render 'edit'
    end
  end


  private

    def user_params
    	#ensures user_params is not exposed to external http requests
      params.require(:user).permit(:name, :username, :email, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      # grab the user object from the URL ID parameter
      @user = User.find(params[:id])
      # redirect to the home page unless that ID matches the current user 
      redirect_to(root_url) unless current_user?(@user)
    end
end
