class CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  include ApplicationHelper
  def create
    # カートに入れるアイテムの情報取得
    cart_item = CartItem.new( cart_item_params )
    # アイテムを入れたユーザの関連付け
    cart_item.end_user_id = current_end_user.id
    # カートへアイテム保存
    cart_item.save
    flash[:notice] = "カート内に商品が追加されました。"
    # カート画面へ遷移
    redirect_to cart_items_path
  end

  def index
    # ログインユーザの全カートアイテム情報を取得
    @cart_items = current_end_user.cart_items
    # 先に商品合計額を算出
    @total_price = @cart_items.map{ | cart_item | subtotal( cart_item.item.listed_price, cart_item.amount, false ) }.sum
  end


  def update
    # 更新するカートアイテム情報を取得
    cart_item = CartItem.find( params[:id] )
    # 更新処理
    cart_item.update( cart_item_params )
    # カート画面へ遷移
    redirect_to cart_items_path
  end

  def destroy
    # ログに取得したidを出力
    logger.debug(params[:id])
    # ログにidの型を出力
    logger.debug(params[:id].class)
    if params[:id]=='destroy_all' then
      # ログに destroy_allの実行を出力
      logger.debug('performed: destroy_all')
      #  destroy_all実行
      destroy_all
      flash[:notice] = "カート内アイテムを全て削除しました。"
    else
      # ログに 1個のカートアイテムを削除したことを出力
      logger.debug('performed: destroy')
      # 削除するカートアイテム情報を取得
      cart_item = CartItem.find( params[:id] )
      # 対象のカートアイテムを削除
      cart_item.destroy
      flash[:notice] = "カート内アイテムを1件削除しました。"
    end
    # カート画面へ遷移
    redirect_to cart_items_path
  end

  private
  # ログインユーザの全カートアイテム削除アクション
  def destroy_all
    # ログインユーザの全カートアイテム情報を取得
    cart_items = current_end_user.cart_items
    # カートアイテムが存在するか判定
    if cart_items.nil? then
      # ない場合
      # flash[ :caution ] = "カートに商品がないため、削除できませんでした。"
    else
      # １個以上ある場合 => 全部削除
      cart_items.map(&:destroy)
      # flash[ :success ] = "削除が完了しました。"
    end
    # カート画面へ遷移はdestroyにて定義されている
  end

  def cart_item_params
    params.require( :cart_item ).permit( :end_user_id, :item_id, :amount )
  end
end
