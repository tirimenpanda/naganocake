class Order < ApplicationRecord
  enum :order_status => ['入金待ち', '入金確認', '製作中', '製作完了']
  belongs_to :end_user
  has_many :order_details
end
