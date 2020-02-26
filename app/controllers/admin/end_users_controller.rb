class Admin::EndUsersController < ApplicationController
	def index
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
		# 該当ユーザのshowページへ遷移
		redirect_to admin_end_user_path( end_user.id )
	end

	private
	def admin_end_user_params
		# パラメータの取得
    params.require( :end_user ).permit( :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted )
  end
end
