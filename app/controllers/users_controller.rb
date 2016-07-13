class UsersController < ApplicationController

	def index
		@user = User.new
	end

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
			
      #flash[:notice] = 'You signed up succefully!'
      #flash[:color] = 'valid'
      redirect_to dashbaord_url and return
    else

      #flash[:notice] = 'Form is invalid.'
     # flash[:color] = 'invalid'
     render 'new'
    end
    
	end

	def login
		@user = User.new(user_params)
	end

	private
	def user_params
		params.require(:user).permit( :First_name, :Last_name, :username, :password)
	end

end
