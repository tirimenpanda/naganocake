class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin_user!
	def new
		@item = Item.new
	end

	def create
		# 新規登録するためのItemオブジェクトの作成と取得値代入
		@item = Item.new( item_params )
		begin
			# 新規商品投稿内容の保存
			@item.save
			# 新規商品投稿内容詳細画面へ
			redirect_to admin_item_path( @item )
		rescue => e
			logger.debug '新規商品の登録に失敗しました。（始）'
			logger.debug e
			logger.debug '新規商品の登録に失敗しました。（終）'
			render :new
		end
	end

	def index
		if params[:id].nil? then
			# ジャンルIDが指定されていない場合
			items = Item.where(selling_status: true)
		else
			# ジャンル指定ありの場合
			# 該当ジャンルオブジェクト取得
			genre = Genre.find( params[:id] )
			# ジャンル表示は有効か否か？
			items = ( genre.is_displayed ? genre.items : nil )
			# 有効(true) なら、対象ジャンル商品情報取得
		end
			@pages = items.all.page(params[:page]).reverse_order
			@counts = items.count
	end

	def show
		# 閲覧したい商品の情報を取得
		@item = Item.find( params[:id] )
	end

	def edit
		@item = Item.find( params[:id] )
	end

	def update
		item = Item.find(params[:id])
		item.update( item_params )
		redirect_to admin_item_path( item )
	end

	private
	def item_params
		# :imge_idではなく:imageっぽい
		params.require(:item).permit( :genre_id, :name, :introduction, :listed_price, :image, :selling_status )
	end
end
