module ItemsHelper
  # 購入個数をプルダウン表示するためのHashに変換するメソッド
  def create_selection_amount( amount=0 )
    # Hashオブジェクトの作成
    dic = Hash.new
    dic[amount]=amount if amount!=0
    20.times do |i|
      i += 1
      dic[i] = i if i!=amount
    end
    return dic
  end

end
