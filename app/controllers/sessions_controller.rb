class SessionsController < ApplicationController

	def new
	end

	def create
#		find email address of user trying to login
		user = User.find_by(email: params[:session][:email].downcase)

#		get user password from database

		if user && user.authenticate(params[:session][:password])

			#			Store user id in session hash which is backed by browser cookies

			session[:user_id] = user.id

#			display login success message

			flash[:success] = "You have successfully logged in"

			redirect_to users_path(user)

		else
#			Create flash message to let user know login failed

			flash.now[:danger] = "There is something wrong with login information"
			render 'new'
		end
	end

#	log out path

	def destroy
		session[:user_id] = nil
		flash[:success] = 'You have successfully logged out'
		redirect_to articles_path
	end

end
