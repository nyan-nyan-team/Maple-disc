class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :end_user
    enum payment_methods: {銀行振込: 1,クレジットカード支払い: 2, 代引き: 3}
    enum payment_methods: {受付: 0, 商品準備中: 1, 出荷済: 2}
end
