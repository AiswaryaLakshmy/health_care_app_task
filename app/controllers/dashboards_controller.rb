class DashboardsController < ApplicationController


	def index
		redirect_to login_path unless @current_user
		@medications = @current_user.medications.all
		# @medications = @current_user.medications

	end

	def destroy
		@medication = Medication.find(params[:id])
    # @medications = @current_user.medications
    	
    @medication.destroy
    redirect_to dashboard_path
  end

end
