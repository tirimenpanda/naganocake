# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# AdminUserテストデータ（全1件）
AdminUser.create( email:'admin@naganocake.com', password:'naganocake')

# EndUserテストデータ（全3件）
EndUser.create( first_name: %?貴明?, last_name: %?藤野?, first_name_kana: %?タカアキ?, last_name_kana: %?フジノ?, postal_code: %?1234567?, address: %?東京都?, phone_number: %?09012345678?, email: %?test@test.com?, password: %?password?)
EndUser.create( first_name: %?晋三?, last_name: %?安倍?, first_name_kana: %?シンゾウ?, last_name_kana: %?アベ?, postal_code: %?1234567?, address: %?国会議事堂?, phone_number: %?09000889464?, email: %?abe@shinzou.com?, password: %?password?)
EndUser.create( first_name: %?太子?, last_name: %?聖徳?, first_name_kana: %?タイシ?, last_name_kana: %?ショウトク?, postal_code: %?1234567?, address: %?法隆寺?, phone_number: %?57427311622?, email: %?syoutoku@taishi.com?, password: %?password?)

# EndUserテストデータ（全3件）
Address.create( end_user_id: 1, postal_code: '1700013', ship_to: '東京都豊島区南池袋１丁目２８−２', consignee: 'ニコニコ本社' )
Address.create( end_user_id: 1, postal_code: '1020072', ship_to: '東京都千代田区飯田橋２丁目７−３', consignee: '竹書房ビル' )
Address.create( end_user_id: 2, postal_code: '7000005', ship_to: '岡山県岡山市北区理大町1-1', consignee: '学校法人加計学園' )
Address.create( end_user_id: 3, postal_code: '5830992', ship_to: '大阪府南河内郡太子町', consignee: '小野妹子' )

# Genreのサンプルデータ（全8件）
Genre.create( name: 'ケーキ')
Genre.create( name: '焼き菓子')
Genre.create( name: 'チョコレート')
Genre.create( name: 'プリン')
Genre.create( name: 'アイスクリーム')
Genre.create( name: '和菓子')
Genre.create( name: 'その他')
Genre.create( name: '表示されないジャンル', is_displayed:  false )

# Itemのサンプルデータ（全8件）
Item.create( genre_id: 1, name:  %?ショートケーキ?, introduction: %?シンプルisベスト!当店人気No.1のケーキです!?, listed_price: 500, image: File.open( './app/assets/images/cake1.png', ?r ) )
Item.create( genre_id: 1, name: %?チョコレートケーキ?, introduction: %?バンホーテンのカカオ豆を使った濃厚チョコレートケーキ?, listed_price: 560, image: File.open( './app/assets/images/cake2.png', ?r ) )
Item.create( genre_id: 1, name: %?チーズケーキ?, introduction: %?北海道産の最高級牛乳使用?, listed_price: 480, image: File.open( './app/assets/images/cake3.png', ?r ) )
Item.create( genre_id: 1, name: %?ミルクレープ?, introduction: %?クレープ生地を15層に重ねたミルクレープです。?, listed_price: 480, image: File.open( './app/assets/images/mille_crepe.png', ?r ) )
Item.create( genre_id: 1, name: %?モンブラン?, introduction: %?秋季限定!ケーキの中にも栗がたっぷり入ったモンブラン!?, listed_price: 580, image: File.open( './app/assets/images/montblanc.png', ?r ) )
Item.create( genre_id: 1, name: %?アップルパイ?, introduction: %?サクッ！！あま〜い❤️シナモンとの相性抜群!長野県産のりんごを贅沢に使って作りました?, listed_price: 580, image: File.open( './app/assets/images/applepie.png', ?r ) )
Item.create( genre_id: 2, name: %?スコーン?, introduction: %?スコーンとは、スコットランド料理の、バノックより重いパン。?, listed_price: 275, image: File.open( './app/assets/images/scone.png', ?r ) )
Item.create( genre_id: 2, name: %?フルーツパウンドケーキ?, introduction: %?アプリコット、ラムレーズン、イチジク、オレンジを贅沢に使ったパウンドケーキ。?, listed_price: 1500, image: File.open( './app/assets/images/pound_cake.png', ?r ) )
Item.create( genre_id: 2, name: %?クッキー?, introduction: %?懐かしい味。素朴なクッキーの3枚セット?, listed_price: 200, image: File.open( './app/assets/images/cookie.png', ?r ) )
Item.create( genre_id: 3, name: %?チョコレート?, introduction: %?バンホーテンのカカオ豆を使ってますよ。?, listed_price: 100, image: File.open( './app/assets/images/chocolate.png', ?r ) )
Item.create( genre_id: 4, name: %?カスタードプリン?, introduction: %?シンプルなプリンです。?, listed_price: 120, image: File.open( './app/assets/images/purin.png', ?r ) )
Item.create( genre_id: 4, name: %?ミルクプリン?, introduction: %?北海道産牛乳を使用したクリームが絶品。とろける食感がたまりません?, listed_price: 180, image: File.open( './app/assets/images/milk_purin.png', ?r ) )
Item.create( genre_id: 6, name: %?羊羹?, introduction: %?北海道産小豆を使用してます。裏ごししてあるので舌触り滑らか。?, listed_price: 800, image: File.open( './app/assets/images/youkan.png', ?r ) )
Item.create( genre_id: 5, name: %?アイスクリーム?, introduction: %?Häagen-Dazsのアイスなので間違いなく美味しいです。?, listed_price: 398, image: File.open( './app/assets/images/icecream.png', ?r ) )
Item.create( genre_id: 7, name: %?チュロス?, introduction: %?各国で広く食べられている揚げ菓子である。?, listed_price: 128, image: File.open( './app/assets/images/Churros.png', ?r ) )
Item.create( genre_id: 8, name: %?これは表示されないジャンルです?, introduction: %?これは表示されないジャンルです?, listed_price: 9999, image: File.open( './app/assets/images/no_image.jpg', ?r ) )
20.times do |i|
 Item.create( genre_id: 9, name: "サンプル(No.#{"%02d" % (i+1)})", introduction: "サンプル説明文(No.#{"%02d" % (i+1)}) #{'ここには商品説明文が入ります'*10}", listed_price: (10_000*rand).to_i, image: File.open( "./app/assets/images/sample#{"%02d" % (i+1)}.png", ?r ) )
end
arr = ( (1..13).to_a  - [Item.find_by( genre_id: 8 ).id] ).shuffle
# arr = ( (1..13).to_a  - Item.find_by( genre_id: 8 )).shuffle
# CartItemのサンプルデータ（全11件）
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 2 )
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 3 )
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 5 )
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 7 )
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 11 )
CartItem.create( end_user_id: 1, item_id: arr.pop, amount: 13 )
CartItem.create( end_user_id: 2, item_id: arr.pop, amount: 17 )
CartItem.create( end_user_id: 2, item_id: arr.pop, amount: 19 )
CartItem.create( end_user_id: 2, item_id: arr.pop, amount: 23)
CartItem.create( end_user_id: 3, item_id: arr.pop, amount: 31 )
CartItem.create( end_user_id: 3, item_id: arr.pop, amount: 37 )
CartItem.create( end_user_id: 3, item_id: arr.pop, amount: 3 )

t = Time.zone.now - 1.day
# Orderのサンプルデータ（全1件）
Order.create( end_user_id: 1, postal_code: "1010041", ship_to: "東京都千代田区神田須田町１−２２", consignee: "株式会社ハル研究所", payment: "クレジットカード", postage: 800, total_price: 15585, order_status: "入金確認", created_at: t )
Order.create( end_user_id: 1, postal_code: "1070052", ship_to: "東京都港区赤坂２丁目１２−２３ キャビンアリーナ赤坂 201", consignee: "株式会社京都アニメーション 東京オフィス", payment: "銀行振込", postage: 800, total_price: 40069, order_status: "入金確認" )
Order.create( end_user_id: 2, postal_code: "1234567", ship_to: "国会議事堂", consignee: "安倍 晋三", payment: "銀行振込", postage: 800, total_price: 348862, order_status: "入金確認" )
Order.create( end_user_id: 3, postal_code: "5830992", ship_to: "大阪府南河内郡太子町", consignee: "小野妹子", payment: "クレジットカード", postage: 800, total_price: 40356, order_status: "入金待ち" )

# Orderdetailのサンプルデータ（全1件）
OrderDetail.create( order_id: 1, item_id: 1, amount: 2, purchased_price: 1100, making_status: "製作完了", created_at: t )
OrderDetail.create( order_id: 1, item_id: 2, amount: 3, purchased_price: 1650, making_status: "製作待ち", created_at: t )
OrderDetail.create( order_id: 1, item_id: 3, amount: 5, purchased_price: 3080, making_status: "製作完了", created_at: t )
OrderDetail.create( order_id: 1, item_id: 4, amount: 7, purchased_price: 3696, making_status: "着手不可", created_at: t )
OrderDetail.create( order_id: 1, item_id: 5, amount: 11, purchased_price: 3322, making_status: "着手不可", created_at: t )
OrderDetail.create( order_id: 1, item_id: 6, amount: 13, purchased_price: 1937, making_status: "製作待ち", created_at: t )
OrderDetail.create( order_id: 2, item_id: 14, amount: 13, purchased_price: 5681, making_status: "着手不可" )
OrderDetail.create( order_id: 2, item_id: 11, amount: 19, purchased_price: 2508, making_status: "製作中" )
OrderDetail.create( order_id: 2, item_id: 8, amount: 120, purchased_price: 31080, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 1, amount: 177, purchased_price: 97350, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 2, amount: 196, purchased_price: 107800, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 3, amount: 232, purchased_price: 142912, making_status: "製作中" )
OrderDetail.create( order_id: 4, item_id: 3, amount: 31, purchased_price: 19096, making_status: "着手不可" )
OrderDetail.create( order_id: 4, item_id: 2, amount: 37, purchased_price: 20350, making_status: "着手不可" )
OrderDetail.create( order_id: 4, item_id: 10, amount: 1, purchased_price: 110, making_status: "着手不可" )
