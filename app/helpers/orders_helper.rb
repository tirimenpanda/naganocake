module OrdersHelper
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
      order_detail.purchased_price = subtotal( cart_item.item.listed_price, cart_item.amount, false )
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

  # 注文履歴一覧用の日時表示
  def order_datetime_format( date_info )
    t = date_info.to_datetime
    sprintf( "%04d/%02d/%02d %02d:%02d:%02d" , t.year, t.month, t.day, t.hour, t.minute, t.sec )
  end

  def order_status_selection(  )
    dic = Hash.new
    ['入金待ち', '入金確認', '発送準備中', '発送済み'].each do | str |
      dic[str] = str
    end
  end

  def making_status_selection(  )
    dic = Hash.new
    ['着手不可', '製作待ち', '製作中', '製作完了' ].each do | str |
      dic[str] = str
    end
  end
end
