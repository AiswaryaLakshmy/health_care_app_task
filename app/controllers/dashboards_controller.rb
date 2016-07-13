class DashboardsController < ApplicationController
	before_action :find_current_user, only: [:index]

	def settings
		# @dashboard = User.find(params[:id])
	end

	def index
		redirect_to login_path unless @current_user
	end

	def new_medications
	end

	private
		def find_current_user
			@current_user = User.find_by(id: session[:current_user])
		end

end
