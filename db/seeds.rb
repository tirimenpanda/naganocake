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
Genre.create( name: 'クッキー')
Genre.create( name: 'チョコレート')
Genre.create( name: 'プリン・ゼリー')
Genre.create( name: '和菓子')
Genre.create( name: 'アイス')
Genre.create( name: 'その他')
Genre.create( name: '表示されないジャンル', is_displayed:  false )
Genre.create( name: 'サンプル')

# Itemのサンプルデータ（全8件）
Item.create( genre_id: 1,  name: 'ショートケーキ', introduction: 'シンプルisベスト', listed_price: 500, image_id: 'test01' )
Item.create( genre_id: 1, name: %q?ショートケーキ?, introduction: %q?シンプルisベスト?, listed_price: 500, image_id: 'test02' )
Item.create( genre_id: 1, name: %?チョコレートケーキ?, introduction: %?バンホーテンのカカオ豆を使っています。?, listed_price: 560, image_id: 'test03' )
Item.create( genre_id: 1, name: %?チーズケーキ?, introduction: %?北海道産の最高級牛乳使用?, listed_price: 480, image_id: 'test04' )
Item.create( genre_id: 2, name: %?スコーン?, introduction: %?スコーンとは、スコットランド料理の、バノックより重いパン。?, listed_price: 275, image_id: 'test05' )
Item.create( genre_id: 7, name: %?ドーナツ?, introduction: %?内側はしっとりふんわりしたケーキのような食感のものや、モチモチした食感のものなどがあり、形状はリング状が多く、ボール状のものなどもある。?, listed_price: 136, image_id: 'test06' )
Item.create( genre_id: 7, name: %?チュロス?, introduction: %?各国で広く食べられている揚げ菓子である。?, listed_price: 128, image_id: 'test07' )
Item.create( genre_id: 7, name: %?アップルパイ?, introduction: %?サクッ！！あま〜い❤️?, listed_price: 236, image_id: 'test08' )
Item.create( genre_id: 8, name: %?これは表示されないジャンルです?, introduction: %?これは表示されないジャンルです?, listed_price: 9999, image_id: 'test09' )
Item.create( genre_id: 3, name: %?チョコレート?, introduction: %?これもバンホーテンのカカオ豆を使ってますよ。?, listed_price: 100, image_id: 'test10' )
Item.create( genre_id: 4, name: %?カスタードプリン?, introduction: %?シンプルなプリンです。?, listed_price: 120, image_id: 'test11' )
Item.create( genre_id: 4, name: %?ミルクプリン?, introduction: %?北海道産牛乳を使用したクリームが絶品。?, listed_price: 180, image_id: 'test12' )
Item.create( genre_id: 5, name: %?羊羹?, introduction: %?北海道産小豆を使用してます。裏ごししてあるので舌触り滑らか。?, listed_price: 800, image_id: 'test13' )
Item.create( genre_id: 6, name: %?バニラアイス?, introduction: %?Häagen-Dazsのアイスなので間違いなく美味しいです。?, listed_price: 398, image_id: 'test14' )
20.times do |i|
  Item.create( genre_id: 9, name: "サンプル(No.#{"%02d" % (i+1)})", introduction: "サンプル説明文(No.#{"%02d" % (i+1)}) #{'ここには商品説明文が入ります'*10}", listed_price: (10_000*rand).to_i, image_id: "test#{Genre.count+1}" )
end


# CartItemのサンプルデータ（全11件）
CartItem.create( end_user_id:1, item_id:1, amount:2 )
CartItem.create( end_user_id:1, item_id:2, amount:3 )
CartItem.create( end_user_id:1, item_id:3, amount:5 )
CartItem.create( end_user_id:1, item_id:4, amount:7 )
CartItem.create( end_user_id:1, item_id:5, amount:11 )
CartItem.create( end_user_id:1, item_id:6, amount:13 )
CartItem.create( end_user_id:2, item_id:1, amount:17 )
CartItem.create( end_user_id:2, item_id:2, amount:19 )
CartItem.create( end_user_id:2, item_id:3, amount:23)
CartItem.create( end_user_id:3, item_id:3, amount:31 )
CartItem.create( end_user_id:3, item_id:2, amount:37 )

# Orderのサンプルデータ（全1件）
Order.create( end_user_id: 1, postal_code: "1010041", ship_to: "東京都千代田区神田須田町１−２２", consignee: "株式会社ハル研究所", payment: "クレジットカード", postage: 800, total_price: 15585, order_status: "入金確認" )
Order.create( end_user_id: 1, postal_code: "1070052", ship_to: "東京都港区赤坂２丁目１２−２３ キャビンアリーナ赤坂 201", consignee: "株式会社京都アニメーション 東京オフィス", payment: "銀行振込", postage: 800, total_price: 40069, order_status: "入金確認" )
Order.create( end_user_id: 2, postal_code: "1234567", ship_to: "国会議事堂", consignee: "安倍 晋三", payment: "銀行振込", postage: 800, total_price: 348862, order_status: "入金確認" )
Order.create( end_user_id: 3, postal_code: "5830992", ship_to: "大阪府南河内郡太子町", consignee: "小野妹子", payment: "クレジットカード", postage: 800, total_price: 40356, order_status: "入金待ち" )

# Orderdetailのサンプルデータ（全1件）
OrderDetail.create( order_id: 1, item_id: 1, amount: 2, purchased_price: 1100, making_status: "製作完了" )
OrderDetail.create( order_id: 1, item_id: 2, amount: 3, purchased_price: 1650, making_status: "製作待ち" )
OrderDetail.create( order_id: 1, item_id: 3, amount: 5, purchased_price: 3080, making_status: "製作完了" )
OrderDetail.create( order_id: 1, item_id: 4, amount: 7, purchased_price: 3696, making_status: "着手不可" )
OrderDetail.create( order_id: 1, item_id: 5, amount: 11, purchased_price: 3322, making_status: "着手不可" )
OrderDetail.create( order_id: 1, item_id: 6, amount: 13, purchased_price: 1937, making_status: "製作待ち" )
OrderDetail.create( order_id: 2, item_id: 14, amount: 13, purchased_price: 5681, making_status: "着手不可" )
OrderDetail.create( order_id: 2, item_id: 11, amount: 19, purchased_price: 2508, making_status: "製作中" )
OrderDetail.create( order_id: 2, item_id: 8, amount: 120, purchased_price: 31080, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 1, amount: 177, purchased_price: 97350, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 2, amount: 196, purchased_price: 107800, making_status: "製作中" )
OrderDetail.create( order_id: 3, item_id: 3, amount: 232, purchased_price: 142912, making_status: "製作中" )
OrderDetail.create( order_id: 4, item_id: 3, amount: 31, purchased_price: 19096, making_status: "着手不可" )
OrderDetail.create( order_id: 4, item_id: 2, amount: 37, purchased_price: 20350, making_status: "着手不可" )
OrderDetail.create( order_id: 4, item_id: 10, amount: 1, purchased_price: 110, making_status: "着手不可" )
