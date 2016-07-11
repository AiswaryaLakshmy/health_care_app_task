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

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

end
