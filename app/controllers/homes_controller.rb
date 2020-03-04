class HomesController < ApplicationController
def top
  # ジャンル表示OKのやつを全部取得
  @genres = Genre.where( is_displayed: true)
  # ジャンル表示OKのやつのidを配列に変換
  genres = @genres.map{ | g | g.id }
  # ジャンル表示OKの商品を全部取得
  items = Item.where( genre_id: genres)
  # ページネーション処理
  @pages = items.page(params[:page]).reverse_order
  # 総商品数カウント（表示可能商品のみ）
  @counts = items.count
end

def home
end
end
