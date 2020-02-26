class Admin::OrdersController < ApplicationController
	def index
	end

	def show
    	today = DateTime.today
     	@orders = Order.where(created_at: today)
	end

	def update_order_status
	end

	def update_making_status
	end
end
