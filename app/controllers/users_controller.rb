class UsersController < ApplicationController

	# def index
	# 	@user = User.new
	# end

	def new
		@user = User.new
	end

	#def show
		#@user = User.find(params[:id])
	#end

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
			@user = User.find_by(username: user_params["username"])
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
		params.require(:user).permit( :First_name, :Last_name, :username, :password)
	end

	def logout_current_user
		session[:current_user] = nil
	end

end
