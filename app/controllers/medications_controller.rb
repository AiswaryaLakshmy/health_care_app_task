class MedicationsController < ApplicationController

	def new_medications
		@medication = Medication.new
	end

	def create
		@medication = Medication.new(medication_params.merge(user_id: @current_user.id))
		@drug = Drug.find(medication_params[:drug_id]) if medication_params[:drug_id].present?
		if @current_user.drugs.include?(@drug)
			@medication = Medication.find_by(drug_id: @drug.id, user_id: @current_user.id)
			@medication.update(medication_params)
		else
			@medication.save 
		end
		if params[:medication][:custom].present?
			@custom_drug = Drug.create(drug_name: params[:medication][:custom], custom_drug: true)
			@medication.update(drug_id: @custom_drug.id)
		end
		redirect_to dashboard_path	
	end

	def destroy
		@medication = Medication.find(params[:id])	
    @medication.drug.destroy if @medication.drug.custom_drug?
    @medication.destroy
    redirect_to dashboard_path
  end

  private
	def medication_params
		params[:medication][:dosage] = params[:dosage].join(' ')
		params.require(:medication).permit( :drug_name, :drug_id, :dosage, :timing)
	end
end
