class UsersController < ApplicationController
	skip_before_filter :find_current_user, only: [:new, :create]

	def index
		@user = Medication.all
	end

	def new
		redirect_to dashboard_url and return if session[:current_user]
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		password = Digest::SHA1.hexdigest(user_params[:password])
		@user.encrypted_password = password
		if user_params[:password] == user_params[:confirm_password]
			if @user.save
				session[:current_user] = @user.id
      	flash[:success] = 'You signed up succefully!'
      	redirect_to dashboard_path and return

    	else
      	flash[:error] = 'Form is invalid.'
      	render 'new'
    	end
    else
    	flash[:error] = 'Password and confirm password doesnt match'
    	render 'new'
    end
	end

	def update
		@user = User.find(params[:id])
		binding.pry
		if @user.update(user_params)
			flash[:success] = 'Updated succefully!'
			redirect_to dashboard_path and return
		else 
			render 'edit'
		end
	end

	def change_password
		current_password = Digest::SHA1.hexdigest(params[:user][:current_password])
		if @current_user.try(:encrypted_password) == current_password
			if user_params[:password] == user_params[:confirm_password]
				password = Digest::SHA1.hexdigest(user_params[:password])
				@current_user.encrypted_password = password
			if @current_user.update(password: user_params[:password])
				flash[:success] = 'Password changed succefully!'
				redirect_to dashboard_path and return
			else 
				render 'edit'
			end
		else
    	flash[:error] = 'New password and confirm password doesnt match'
    	render 'edit'
		end
		else
			flash[:error] = 'Current password is incorrect'
	 	end
	end

	def login
		redirect_to dashboard_url and return if session[:current_user]
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

	def logout
		logout_current_user
		flash[:success] = 'Logged out successfully'
		redirect_to login_path
	end

	private
	def user_params
		params.require(:user).permit( :First_name, :Last_name, :username, :password, :confirm_password )
	end

	def logout_current_user
		session[:current_user] = nil
	end

end
