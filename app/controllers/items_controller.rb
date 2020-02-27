class ItemsController < ApplicationController
	def index
		items = Item.where(selling_status: true)
		@pages = items.all.page(params[:page]).reverse_order
		@counts = items.count
	end

	def show
	end
end
