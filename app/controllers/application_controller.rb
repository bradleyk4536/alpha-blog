class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#	below methods are available to all of the controllers but not to all the view by default
#	The below helper method is used to assign to the views

	helper_method :current_user, :logged_in?

	def current_user
		#		If user is stored in session hash then find the user stored user id in user id
		@current_user ||=User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
#		If there is a current user below will return true, if not will return false
		!!current_user
	end

#	Used to restrict actions of login users

	def required_user

		if !logged_in?
			flash[:danger] = "You must be logged in to perform the action"
			redirect_to articles_path
		end
	end
end
