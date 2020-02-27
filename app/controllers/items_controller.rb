class ItemsController < ApplicationController
	def index
		# ジャンル表示OKのやつを全部取得
		@genres = Genre.where( is_displayed: true)
		# ジャンルIDが指定されているかで分岐処理
		if !genre_params then
			# ジャンルIDが指定されていない場合
			# ジャンル表示OKのやつを全部取得
			genres = @genres.map{ | g | g.id }
			# ジャンル表示OKの商品を全部取得
			items = Item.where( genre_id: genres)
			# indexページタイトル情報
			@info = '商品'
		else
			# ジャンル指定ありの場合
			# 該当ジャンルオブジェクト取得
			genre = Genre.find( genre_params[:id] )
			# ジャンル表示は有効か否か？
			items = ( genre.is_displayed ? genre.items : nil ) # 有効(true) なら、対象ジャンル商品情報取得
			# indexページタイトル情報
			@info = genre.name
		end
			@pages = items.page(params[:page]).reverse_order
			@counts = items.count
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

	private
	def genre_params
		begin
			params.require(:genre)
		rescue
			false
		end
	end
end
