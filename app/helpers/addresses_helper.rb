module AddressesHelper
  # 小計の計算
  def subtotal( price, amount ) # 税抜価格 + 個数
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
    # ３桁区切りで値を返す
    number_separation ( sn )
  end

  # 整数を３桁区切りの文字列として返すメソッド
  def number_separation ( number )
    # 最終的に返す変数
    result = String.new
    # カンマ区切り処理
    loop do
      # 下３桁の値を格納
      result = ( number % 1000 ).to_s + result
      # 下３桁を除去
      number /= 1000
      if number < 1 then
        # 上位の桁がなければ、結果を返す
        return result
        break #念のため
      else
        # さらに上位の桁がある場合
        result = ?, + result
      end # if
    end # loop do
  end # method

  # 日付表示形式に変換
  def date_format( date_data )
    x = date_data
    %(#{"%04d" % x.year}/#{"%02d" % x.month}/#{"%02d" % x.day})
  end

  # 日付表示形式に変換
  def postal_code_format( postal_code)
    "〒 #{postal_code.[0...3]}-#{postal_code[3..-1]}"
  end
end
