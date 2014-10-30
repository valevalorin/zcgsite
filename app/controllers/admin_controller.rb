class AdminController < ApplicationController
	before_action :authorize
	
	def index
	end

	private
		def authorize
			unless session[:logged_in]
				redirect_to root_path
			end
		end
end
