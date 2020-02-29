class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin_user!
	def new
		@item = Item.new
	end

	def create
		# 新規登録するためのItemオブジェクトの作成と取得値代入
		item = Item.new( item_params )
		# 新規商品投稿内容の保存
		item.save
		# 新規商品投稿内容詳細画面へ
		redirect_to admin_item_path( item )
	end

	def index
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

	private
	def item_params
		# :imge_idではなく:imageっぽい
		params.require(:item).permit( :genre_id, :name, :introduction, :listed_price, :image, :selling_status )
	end
end
