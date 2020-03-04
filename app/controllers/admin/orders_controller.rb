class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin_user!
	def index
		# logger.debug 'ここみろ'
		# logger.debug end_user_params
		if !!end_user_params then
			# 会員詳細ページからアクセスされた場合
			# 会員IDから該当エンドユーザを検索
			end_user = EndUser.find( end_user_params[:id] )
			# 会員情報から注文履歴をピックアップ
			@orders = end_user.orders
			# タイトル情報作成
			@info = "#{end_user.last_name} #{end_user.first_name}様の注文履歴（全#{@orders.count}件）"
		else
			# 全注文データの取得
			@orders = Order.all
			# タイトル情報作成
			@info = "全注文履歴一覧（全#{@orders.count}件）"
		end
	end

	def show
		# 詳細を確認したい注文データの取得
		@order = Order.find(params[:id])
	end

	def update_order_status
		# 更新するデータをピックアップ
		order = Order.find( params[:id] )
		# 更新処理
		order.update( order_status_params )
		flash[:success] = '注文ステータスの更新に成功しました。'
		# 注文詳細ページへ戻る
		redirect_to admin_order_path( order )
	end

	def update_making_status
		# 更新するデータをピックアップ
		order_detail = OrderDetail.find( params[:id] )
		# 更新処理
		order_detail.update( making_status_params )
		flash[:success] = '製作ステータスの更新に成功しました。'
		# 注文詳細ページへ戻る
		redirect_to admin_order_path( order_detail.order )
	end

	private
	def order_status_params
		# Ordersテーブルのorder_statusのみ取得
		params.require(:order).permit(:order_status)
	end

	def making_status_params
		# OrderDetailsテーブルのmaking_statusのみ取得
		params.require(:order_detail).permit(:making_status)
	end

	def end_user_params
		# EndUsersテーブルのデータ存在判定
		begin
			params.require( :end_user )
		rescue
			false
		end
	end
end
