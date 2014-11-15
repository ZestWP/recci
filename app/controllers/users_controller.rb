class UsersController < ApplicationController
  
  protect_from_forgery with: :exception
  
  before_filter :validate_user
  
  before_action :set_user, only: [:destroy, :update]
  
	def new
		@user = User.new
	end

	def index
		@users = User.where("level > '#{session[:level]}'")
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to root_url, :notice => "Signed up!"
		else
		render "new"
		end
	end

	def update
		cuser = User.find(session[:user_id])

		if cuser
		   user = User.authenticate(cuser.email, params[:old_password])
		end
		
		if user
			val = User.valid(params[:password], params[:password_confirmation])
			if val
				user.password = params[:password]
				user.save
				redirect_to root_url, :notice => "Password changed successfully"
			else
				flash[:error] = "New Password not matched"
				redirect_to change_password_new_url
			end
		else
			flash[:error] = "Old Password not matched"
			redirect_to change_password_new_url
		end
		
	end
	
	def destroy
		@user.destroy
		redirect_to users_url, :notice => "User deleted"
	end
	
    private

	def set_user
      @user = User.find(params[:id])
    end
	
	def user_params
	  params.require(:user).permit(:email, :password, :level, :password_confirmation)
	end
	
	
end
