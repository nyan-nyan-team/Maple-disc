class Product < ApplicationRecord
    enum status: [['---',""],['売り切れ', 1],['販売中', 2]]

    def total_arrival_quantity
        arrivals.each do |arrival|
        total_arrival_quantity += arrival.quantity
        end
    end

    def total_order_detail_quantity
        order_details.each do |order_detail|
        total_order_detail_quantity += order_detail.quantity
        end
    end

    validates :title, :explanation ,:amount , presence: true
    attachment :image

    has_many :discs, inverse_of: :product
    accepts_nested_attributes_for :discs , reject_if: :all_blank , allow_destroy: true

    belongs_to :artist 
    belongs_to :genre
    belongs_to :label
    has_many :arrivals
    has_many :order_details
    has_many :cart_products

end
