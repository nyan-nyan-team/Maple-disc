class Product < ApplicationRecord
    enum status: [['---',""],['売り切れ', 1],['販売中', 2]]
    acts_as_paranoid
    def total_arrival_quantity
        total_arrival_quantity = 0
        arrivals.each do |arrival|
        total_arrival_quantity = arrival.quantity + total_arrival_quantity
            unless arrival.quantity.nil?
                total_arrival_quantity = arrival.quantity + total_arrival_quantity

            end
        end
        total_arrival_quantity
    end

    def total_order_detail_quantity
        total_order_detail_quantity = 0
        order_details.each do |order_detail|
            unless order_detail.quantity.nil?
                total_order_detail_quantity = order_detail.quantity + total_order_detail_quantity
        
            end
        end
        total_order_detail_quantity
    end

    def included_price
        included_price = (amount * 1.1).floor(0)
    end

    #validates :title, presence: true
    #validates :explanation, presence: true
    #validates :amount, presence: true
    attachment :image

    has_many :discs, inverse_of: :product
    accepts_nested_attributes_for :discs , reject_if: :all_blank , allow_destroy: true

    belongs_to :artist 
    belongs_to :genre
    belongs_to :label
    has_many :arrivals
    has_many :order_details
    has_many :cart_products
    has_many :order_details

end

