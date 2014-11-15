class SessionsController < ApplicationController
def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    session[:level] = user.level
    redirect_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  session[:level] = nil
  redirect_to root_url, :notice => "Logged out!"
end

def show
 if session[:user_id]
      # continue to current_user url
    else
      flash[:error] = "Please Login to access this page"
      redirect_to "/log_in"
    end
end

end
