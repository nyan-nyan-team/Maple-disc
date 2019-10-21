class CartProduct < ApplicationRecord
    belongs_to :end_user
    belongs_to :product

    def total_arrival_quantity
        total_arrival_quantity = 0
        arrivals.each do |arrival|
            total_arrival_quantity = arrival.quantity + total_arrival_quantity
        end
        total_arrival_quantity
    end

    def total_order_detail_quantity
        total_order_detail_quantity = 0
        order_details.each do |order_detail|
            unless order_detail.quantity.nil?
                total_order_detail_quantity = order_detail.quantity + total_order_detail_quantity
            
        end
        total_order_detail_quantity
    end
end