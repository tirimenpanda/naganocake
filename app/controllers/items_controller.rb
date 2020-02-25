class ItemsController < ApplicationController
	def index
	end

	def show
		# 閲覧したい商品の情報を取得
		@item = Item.find( params[:id] )
		if end_user_signed_in? then
			# ログインユーザで既にカートに入っているアイテムであった場合の処理
			@cart_item = current_end_user.cart_items.find_by( item_id: params[:id] )
		end
		if @cart_item.nil? then
			@cart_item = CartItem.new
		end
	end
end
