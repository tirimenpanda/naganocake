class ItemsController < ApplicationController
	def index
		# ジャンルIDが指定されているかで分岐処理
		if params[:id].nil? then
			# ジャンルIDが指定されていない場合
			# 全ジャンル取得
			genres = Genre.where( is_displayed:true )
			# 表示が有効なジャンルの商品情報を取得
			@items = Item.where( genre_id: genres.map{ | genre | genre.id } )
		else
			# ジャンル指定ありの場合
			# 該当ジャンルオブジェクト取得
			genre = Genre.find( params[:id] )
			# ジャンル表示は有効か否か？
			@items = ( genre.is_displayed ? genre.items : nil )
			# 有効(true) なら、対象ジャンル商品情報取得
		end
	end

	def show
		# 閲覧したい商品の情報を取得
		@item = Item.find( params[:id] )
		# ログインユーザか判定？
		if end_user_signed_in? then
			# 既にカートに入っているアイテムを取得 => nilの可能性もある
			@cart_item = current_end_user.cart_items.find_by( item_id: params[:id] )
		end
		# ログインユーザではない、または
		# ログインユーザだがカートにこのページの商品が入っていない場合
		if @cart_item.nil? then
			# 新規CartItemオブジェクトの作成
			@cart_item = CartItem.new
		end
	end
end
