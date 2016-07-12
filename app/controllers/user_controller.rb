class UserController < ApplicationController

	def index
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to user_index_path
	end

	def signup
		@user = User.new(user_params)

		if @user.save
			redirect_to new_user_path
		else
			render 'index'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

end
