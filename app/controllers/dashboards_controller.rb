class DashboardsController < ApplicationController

	def settings
		@dashboard = @user.find(params[:id])
	end

	def dashboard
		
	end

	def new_medications
	end

end
