module ApplicationHelper
  # 小計の計算
  # ( 税抜価格, 個数, true => 小計をIntegerで返す )
  def subtotal( price, amount, formatting=false )
    # 引数に不適切な値が渡された場合の回避処理
    begin
      # 小数切り捨て
      sn = price * amount * 110 / 100
    rescue
      # 計算エラーが生じた場合はエラー文字列を返す
      # 基本的にはありえないけど
      puts %?price=#{ price }, amount=#{ amount }?
      return 'Error'
    end
    # リターンの書式を決める
    if formatting then
      # Integerで返す
      sn
    else
      # ３桁区切りで値を返す
      number_separation ( sn )
    end
  end

  # 整数を３桁区切りの文字列として返すメソッド
  def number_separation ( number )
    # 返す変数
    result = number.to_s
    # 「,」を入れる数の導出
    sep = ( result.length - 1 ) / 3
    # カンマ区切り処理
    sep.times do |i|
      # 大きいくらいの方から「,」を挿入
      result.insert( -3*( sep - i )-1, ?, )
    end
    # 処理結果を返す
    return result
  end # method

  # 日付表示形式に変換
  def date_format( date_data )
    x = date_data
    %(#{"%04d" % x.year}/#{"%02d" % x.month}/#{"%02d" % x.day})
  end

  # 日付表示形式に変換
  def postal_code_format( postal_code)
    "〒 #{postal_code[0...3]}-#{postal_code[3..-1]}"
  end

  # 配送先一覧をプルダウン表示するためのHashに変換するメソッド
  def create_selection( addresses_data )
    # Hashオブジェクトの作成
    dic = Hash.new
    # 配送先が登録されているか確認
    if addresses_data.count==0 then
      # １件もない場合
      dic[:登録済の配送先がありません] = 0
      # { 登録済の配送先がありません:0 }
      return dic
    end
    # 配送先が1件以上ある場合
    addresses_data.each do | address |
      # 配送先情報を１行に結合
      str = join_address( address.postal_code, address.ship_to, address.consignee )
      # '配送先情報':address_idを追加
      dic[str] = address.id
    end
    # { '配送先情報1': address_id, ... }
    return dic
  end

  # 配送先情報を１行にまとめる
  def join_address( postal_code, address, name)
    # 返す変数の作成
    str = String.new
    # 先頭に郵便番号を配置
    str = postal_code_format( postal_code )
    # ２番目に住所を配置
    str += " #{ address }"
    # ３番目に宛名を配置
    str += " #{ name }"
    # 結合した配送先情報を返す
    return str
  end
end
