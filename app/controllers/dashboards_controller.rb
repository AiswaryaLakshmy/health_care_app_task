class DashboardsController < ApplicationController


	def index
		redirect_to login_path unless @current_user
		@medications = @current_user.medications.all
		# @medications = @current_user.medications
	end

	

end
