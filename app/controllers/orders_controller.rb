class OrdersController < ApplicationController
  # ショッピングカート画面 => 購入情報画面へ
  def new
    # エンドユーザオブジェクトを取得
    end_user =  EndUser.find( current_user.id )
    # 商品がカートに入っているか確認
    if end_user.cart_items.nil? then
      # カートに商品が入っていない場合
      # 警告内容（カートの商品０の通知）の格納
      # flash[:caution] = 'カートに商品がありません。'
      # カート画面へ戻す
      redirect_to cart_items_path
    end
    # 空のorderオブジェクトを作成
    @order = Order.new
  end


  # 購入情報入力画面 => 注文情報確認画面へ
  def confirm
    # 郵便番号、配送先、宛先、支払方法の情報を取得
    @order = Order.new( cart_item_params )
    # => ここでは入力情報のバリデーションは実施しない
  end


  # 注文情報確認画面 => サンクスページへ
  def create
    # orderテーブルの全てのカラム情報を取得
    order = Order.new( cart_item_params )
    # ユーザの関連付け
    order.user_id = current_user.id
    # 注文テーブルへの情報登録が適しているか判定
    return
    if order.save then
      # 成功した場合
      # エンドユーザオブジェクトを取得
      end_user =  EndUser.find( current_user.id )
      # 購入商品の種類だけ実行
      end_user.cart_items.each do | cart_item |
        # 空のOrderDetailオブジェクト作成
        order_detail = OrderDetail.new
        # 1. order_detailテーブルに購入商品情報を保存
        # 2. 登録した購入商品をcart_itemsから削除
      end
      # サンクスページへ遷移
      redirect_to finish_path # リンク名は適当
    else
      # 入力に不備があった場合（今回は想定されてない？）
      # 警告内容（購入情報の不備）の説明
      # flash[:caution] = '新しいお届け先情報に不備があります。'
      # 空のorderオブジェクトを作成
      # @order = Order.new
      # 購入情報入力画面へ遷移
      redirect_to new_order_path
    end
  end


  def index
    # エンドユーザオブジェクトを取得
    end_user =  EndUser.find( current_user.id )
    # ログインユーザのカートアイテムを全部取得
    @order = end_user.orders
  end


  def show
    @orders = Order.find( params[:id] )
  end

  def update
  end

  private
  def cart_item_params
    # orderテーブルの全てのカラム情報の取得を許可
    params.require( :order ).permit( :postal_code, :ship_to,
      :consignee, :payment, :postage, :total_price, :order_status )
    end
end
