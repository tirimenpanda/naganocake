class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update_order_status
		# 更新するデータをピックアップ
		order = Order.find( params[:id] )
		# 更新処理
		order.update( order_status_params )
		# 注文詳細ページへ戻る
		redirect_to admin_order_path( order )
	end

	def update_making_status
		# 更新するデータをピックアップ
		order_detail = OrderDetail.find( params[:id] )
		# 更新処理
		order_detail.update( making_status_params )
		# 注文詳細ページへ戻る
		redirect_to admin_order_path( order_detail.order )
	end

private
	def order_status_params
		params.require(:order).permit(:order_status)
	end

	def making_status_params
		params.require(:order_detail).permit(:making_status)
	end
end
