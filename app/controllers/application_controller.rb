class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def validate_user() #might need to pass id and current_user
    if session[:user_id]
      # continue to current_user url
    else
      flash[:error] = "Please Login to access this page"
      redirect_to "/log_in"
    end
  end
  
  def validate_level() 
    if session[:level] && session[:level] == 1
      # continue to current_user url
    else
      flash[:error] = "You are not authorized"
      redirect_to root_url
    end
  end

end
