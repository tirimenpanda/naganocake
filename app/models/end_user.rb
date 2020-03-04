class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  has_many :orders
  has_many :addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [ :email, :is_deleted ]
  columns = %w? first_name last_name first_name_kana last_name_kana address phone_number email ?
  columns.each do |column|
    eval( %?validates :#{column}, presence: true? )
  end
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "7桁の数字で入力されていません" }
end
