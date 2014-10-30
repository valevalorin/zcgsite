
class SessionController < ApplicationController
	def index
	end

	def login
		if User.authenticate(params[:username], params[:password])
			session[:logged_in] = true
			redirect_to(root_path)
		else
			session[:logged_in] = false
			redirect_to 'login'
		end
	end

	def logout
		reset_session
		redirect_to root_path
	end
end
