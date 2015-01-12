class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			# Sign user in and show user's page
			sign_in user
			redirect_to user
		else
			#create error message & re-render sign in page (errors can be: wrong email/password combo, email does not exist, etc.)
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
