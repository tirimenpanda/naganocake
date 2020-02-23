class AddressesController < ApplicationController
  def index
    # 新規配送先作成
    @address = Address.new
    # ログインユーザ情報取得
    end_user = EndUser.find( current_user.id )
    # ログインユーザの登録されている配送先一覧取得
    @addresses = end_user.addresses
  end

  def create
    # 編集する配送先を検索
    address = Address.find( address_params )
    # ユーザの関連付け
    address.user_id = current_user.id
    # 新規配送先情報保存
    address.save
    # Indexへ遷移
    redirect_to addresses_path
  end

  def edit
    # 編集する配送先を検索
    @address = Address.find( params[:id] )
  end

  def update
    # 変更する配送先を検索
    address = Address.find( params[:id] )
    # 対象の 配送先情報を更新
    address.update( address_params )
    # Indexへ遷移
    redirect_to addresses_path
  end

  def destroy
    # 削除する配送先を検索
    address = Address.find( params[:id] )
    # 対象の配送先情報を削除
    address.destroy
    # Indexへ遷移
    redirect_to addresses_path
  end

  private
  def address_params
    params.require( :address ).permit( :postal_code, :ship_to, :consignee )
  end
end
