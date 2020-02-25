class OrdersController < ApplicationController
  include ApplicationHelper
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
      # redirect_to cart_items_path
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
    # orderテーブルのorder_status以外の全てのカラム情報の取得を許可
    params.require( :order ).permit( :postal_code, :ship_to, :consignee, :payment, :postage, :total_price )
  end

  # 自分のカートアイテムから、保存前のOrderDetailオブジェクト群に書き換え
  def gets_purchasing_information( cart_items )
    # 合計金額を格納する変数
    @total_price = 0
    objects = cart_items.map do | cart_item |
      # 空のOrderDetailオブジェクトを作成
      order_detail = OrderDetail.new
      # item_idを取得
      order_detail.item_id = cart_item.item_id
      # 購入個数を取得
      order_detail.amount = cart_item.amount
      # 購入価格を算出・取得
      order_detail.purchased_price = subtotal( cart_item.item.listed_price, cart_item.amount, true )
      # 各商品の購入金額の加算処理
      @total_price += order_detail.purchased_price
      # order_id以外が入力されたOrderDetailオブジェクトを返す
      order_detail
    end
    # OrderDetailオブジェクト群に変換された変数を返す
    return objects
  end

  # 配送先情報を該当カラム３種に保存し直す
  def regulate_order_format( order )
    # -1 => 自分宛, -2 => 配送先一覧から, -3 => 新しいお届け先
    case order.postage
    when -1 then
      # 自分宛
      # 配送先情報の更新
      order = input_confirm_data( order, current_end_user.postal_code, current_end_user.address, current_end_user.last_name + ' ' + current_end_user.first_name )
    when -2 then
      # 配送先一覧から
      #order.total_priceには希望配送先のaddress_idが格納されている
      address = Address.find( order.total_price )
      # 配送先情報の更新
      order = input_confirm_data( order, address.postal_code, address.ship_to, address.consignee )
    else
      # 新しいお届け先の情報は適正なカラムに格納されているため、特にデータはいじらない
      nil
    end
    # 送料カラム情報をリセット
    order.postage = nil
    # 合計額のカラム情報をリセット
    order.total_price = nil
    # 配送先情報を適正に処理したオブジェクトを返す
    return order
  end

  # 配送先情報の更新処理
  def input_confirm_data( order, postal_code_data, ship_to_data, consignee_data )
    # 郵便番号の格納
    order.postal_code = postal_code_data
    # 配送先住所の格納
    order.ship_to = ship_to_data
    # 宛名の格納
    order.consignee = consignee_data
    # 配送先情報の処理されたオブジェクトを返す
    return order
  end
end
