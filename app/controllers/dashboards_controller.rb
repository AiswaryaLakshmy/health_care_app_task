class DashboardsController < ApplicationController
	before_action :find_current_user, only: [ :user_settings, :new_medications, :index]


	def index
		redirect_to login_path unless @current_user
		@medication = Medication.new
	end



	private
	def find_current_user
		@current_user = User.find_by(id: session[:current_user])
	end

end
