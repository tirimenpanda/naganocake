class Order < ApplicationRecord
  # ↓2/26追記マージの時必要↓誤字訂正
  enum :order_status => ['入金待ち', '入金確認', '発送準備中', '発送済み']
  # ↓2/24追記マージの時必要↓
  enum :payment => ['クレジットカード', '銀行振込']
  belongs_to :end_user
  has_many :order_details
end
