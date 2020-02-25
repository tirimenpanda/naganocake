class EndUsersController < ApplicationController
before_action :authenticate_end_user!

  def edit
    # なし
  end

  def update
    # ログインユーザ情報取得
    end_user = EndUser.find( current_end_user.id )
    # ユーザ情報更新
    end_user.update( end_user_params )
    # ユーザが退会状態に変化した場合の処理
    if end_user.is_deleted then
      logger.debug 'ログアウト処理実行'
      # ログアウト処理
      sign_out end_user
      redirect_to root_path
      return
    end
    # ログインユーザ詳細画面へ遷移
    redirect_to end_users_path
  end

  def show
    # なし
  end

  private
  def end_user_params
    params.require( :end_user ).permit( :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted )
  end

end
