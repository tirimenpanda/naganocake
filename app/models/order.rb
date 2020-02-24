class Order < ApplicationRecord
  enum :order_status => ['入金待ち', '入金確認', '製作中', '製作完了']
  # ↓2/24追記マージの時必要↓
  enum :payment => ['クレジットカード', '銀行振込']
  belongs_to :end_user
  has_many :order_details
end
