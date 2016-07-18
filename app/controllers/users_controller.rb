class UsersController < ApplicationController

	def index
		@user = Medication.all
	end

	def new
		@user = User.new
	end

	# def show
	#  	@user = User.find(params[:id])
	# 	@medications = @user.medications
	# end

	def create
		@user = User.new(user_params)
		password = Digest::SHA1.hexdigest(user_params[:password])
		@user.encrypted_password = password
		 if @user.save
			
      flash[:success] = 'You signed up succefully!'
      redirect_to dashboard_path and return
    else

      #flash[:notice] = 'Form is invalid.'
      #flash[:color] = 'invalid'
     render 'new'
    end
    
	end

	def login
		if request.post?
			password = Digest::SHA1.hexdigest(user_params[:password])
			@user = User.find_by(username: user_params[:username])
			if @user.try(:encrypted_password) == password
				#username and password matched
				session[:current_user] = @user.id
				redirect_to dashboard_url and return
				
			else
				#password is wrong
				flash[:error] = 'Invalid username or password'
				redirect_to :back
			end
		end
	end

	def new_medications
		@medication = Medication.new

	end

	def medications
		@medication = Medication.new(drug_params)
		@medication.save
		redirect_to dashboard_path
	end

	def user_settings
		
	end

	def logout
		logout_current_user
		flash[:success] = 'Logged out successfully'
		redirect_to login_path
	end

	

	private
	def user_params
		params.require(:user).permit( :First_name, :Last_name, :username, :password )
	end

	def logout_current_user
		session[:current_user] = nil
	end

	def drug_params
		params[:medication][:dosage] = params[:dosage].join(' ')
		params.require(:medication).permit( :drug_name, :dosage, :timing, :custom_drug )
	end

end
