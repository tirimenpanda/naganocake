class Admin::EndUsersController < ApplicationController
	def index
		@users = EndUser.all
		@user = EndUser.find(params[:id])
	end

	def show
	end

	def edit
	end

	def update
	end
end
