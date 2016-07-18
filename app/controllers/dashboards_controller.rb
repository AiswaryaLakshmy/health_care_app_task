class DashboardsController < ApplicationController
	before_action :find_current_user, only: [ :index, :destroy ]


	def index
		redirect_to login_path unless @current_user
		@medications = Medication.all
		# @medications = @current_user.medications

	end

	def destroy
		@medication = Medication.find(params[:id])
    # @medications = @current_user.medications
    	
    @medication.destroy
    redirect_to dashboard_path
  end


	private
	def find_current_user
		@current_user = User.find_by(id: session[:current_user])
	end

end
