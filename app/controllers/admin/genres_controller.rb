class Admin::GenresController < ApplicationController
	def index
	end

	def create
	end

	def edit
		@genres = Genre.find(params[:id])
	end

	def update
	end

	private
	def genres_params
		params.require(:genres).permit(:name, :is_displayed)
	end
end
