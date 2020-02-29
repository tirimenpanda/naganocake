class OrdersController < ApplicationController
  include ApplicationHelper
  include OrdersHelper
  before_action :authenticate_end_user!
  # ショッピングカート画面 => 購入情報画面へ
  def new
    # 商品がカートに入っているか確認
    if current_end_user.cart_items.count == 0 then
      # ログに商品がないことを出力通知
      logger.debug ( '（商品が）ないです' )
      # カートに商品が入っていない場合
      # 警告内容（カートの商品０の通知）の格納
      # flash[:caution] = 'カートに商品がありません。'
      # カート画面へ戻す
      redirect_to cart_items_path
      return
    end
    # ログに商品があることを出力通知
    # logger.debug ( 'ありますねぇ' )
    # 空のorderオブジェクトを作成
    @order = Order.new
  end

  # 注文情報確認画面 => サンクスページへ
  def create
    # orderテーブルの全てのカラム情報を取得
    order = Order.new( cart_item_params )
    # ユーザの関連付け
    order.end_user_id = current_end_user.id
    # 注文履歴の登録
    order.save
    # OrderDetailテーブルに購入商品の情報を追加する処理
    gets_purchasing_information( current_end_user.cart_items ).each do | order_detail |
      # order_idの格納
      order_detail.order_id = order.id
      # OrderDetailテーブルに登録
      order_detail.save
    end
    # ログインユーザのかカートアイテムを全部削除
    current_end_user.cart_items.destroy_all
    # 購入情報入力画面へ遷移
    redirect_to orders_thanks_path
  end

  # 注文履歴（一覧）画面
  def index
    # ログインユーザのカートアイテムを全部取得
    @orders = current_end_user.orders
  end

  # show, confirm, thaksが全部ここに来る
  def show
    #  params[:id]で分岐処理
    case params[:id]
    when 'confirm' then
      #  confirmページに行きたい場合
      confirm
      render action: :confirm
    when 'thanks' then
      #  thanksページに行きたい場合
      thanks
      render action: :thanks
    else
      #  showページに行きたい場合
      @order = Order.find( params[:id] )
    end
  end

  # 購入情報入力画面 => 注文情報確認画面へ
  def confirm
    # 郵便番号、配送先、宛先、支払方法の情報を取得
    order = Order.new( cart_item_params )
    # 配送先情報などの処理（手抜き）
    @order = regulate_order_format( order )
    # 送料
    @default_postage = 800
    # 自分のカートアイテムから、保存前のOrderDetailオブジェクト群を取得
    @order_details = gets_purchasing_information( current_end_user.cart_items )
  end

  def thanks
  end


  private
  def cart_item_params
    # Ordersテーブルのorder_status以外の全てのカラム情報の取得を許可
    params.require( :order ).permit( :postal_code, :ship_to, :consignee, :payment, :postage, :total_price )
  end
end
