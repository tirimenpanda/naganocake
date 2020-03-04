class Admin::EndUsersController < ApplicationController
	before_action :authenticate_admin_user!
	def index
		@users = EndUser.all
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		# 編集されるユーザをピックアップ
		end_user = EndUser.find(params[:id])
		# アップデート
		end_user.update( admin_end_user_params )
		# フラッシュメッセージ
		flash[:success] = '会員情報を更新しました。'
		# 該当ユーザのshowページへ遷移
		redirect_to admin_end_user_path( end_user.id )
	end

	private
	def admin_end_user_params
		# パラメータの取得
    params.require( :end_user ).permit( :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted )
  end
end
