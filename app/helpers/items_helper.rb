module ItemsHelper
  # 購入個数をプルダウン表示するためのHashに変換するメソッド
  def create_selection_amount( amount=0 )
    # Hashオブジェクトの作成
    dic = Hash.new
    # 0以外の場合は既にカートに入っている個数を先頭に持ってくる
    dic[amount]=amount if amount>0
    20.times do |i|
      i += 1
      dic[i] = i if i!=amount
    end
    return dic
  end

  # ジャンル選択をプルダウン表示するためのHashに変換するメソッド
  def create_selection_genre()
    # Hashオブジェクトの作成
    dic = Hash.new
    # Genresテーブルに登録されている全てを登録
    Genre.all.each do | genre |
      # 表示可・不可は問わない
      dic[ genre.name ] = genre.id
    end
    return dic
  end
end
