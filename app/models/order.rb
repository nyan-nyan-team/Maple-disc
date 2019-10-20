class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :end_user
    enum payment_methods: {銀行振込: 0,クレジットカード支払い: 1, 代引き: 2}
    enum delivery_status: {受付: 0, 商品準備中: 1, 出荷済: 2}
end
