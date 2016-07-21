class MedicationsController < ApplicationController

	def new_medications
		@medication = Medication.new

	end

	def create
		@medication = Medication.new(medication_params.merge(user_id: @current_user.id))
		@medication.save
		redirect_to dashboard_path
	end

	def destroy
		@medication = Medication.find(params[:id])
    # @medications = @current_user.medications 	
    @medication.destroy
    redirect_to dashboard_path
  end

  private

	def medication_params
		params[:medication][:dosage] = params[:dosage].join(' ')
		params.require(:medication).permit( :drug_id, :dosage, :timing, :custom_drug )
	end

end

