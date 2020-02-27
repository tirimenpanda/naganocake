class Admin::ItemsController < ApplicationController
	def new
		@item = Item.new
	end

	def create
		# 新規登録するためのItemオブジェクトの作成と取得値代入
		item = Item.new( item_params )
		# 投稿内容の保存
		item.save
		redirect_to admin_item_path( item )
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	private
	def item_params
		# :imge_idではなく:imageっぽい
		params.require(:item).permit( :genre_id, :name, :introduction, :listed_price, :image, :selling_status )
	end
end
