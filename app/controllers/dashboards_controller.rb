class DashboardsController < ApplicationController
	before_action :find_current_user, only: [ :user_settings, :new_medications, :index]

	def user_settings
		
	end

	def index
		redirect_to login_path unless @current_user
	end

	def new_medications

	end

	private
		def find_current_user
			@current_user = User.find_by(id: session[:current_user])
		end

end
