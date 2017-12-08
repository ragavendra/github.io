class SessionsController < ApplicationController
  
	def new
  end

	def create
		user = User.find_by_email(params[:session][:email].downcase)

		#auth returns true if valid
		if user && user.authenticate(params[:session][:password])
			flash[:message] = "Login successful"
			log_in user
			redirect_to user
		else
			flash[:danger] = "Login not successful"
			render 'new'
		end

	end

	def destroy
	end

end
