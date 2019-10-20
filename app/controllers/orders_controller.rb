class OrdersController < ApplicationController
    before_action :authenticate_end_user!
    def index
        @orders = current_end_user.orders.page(params[:page]).per(2)
        @delivery_status = params[:delivery_status].to_i
        case @delivery_status
        when 0
            @delivery_status = '受付'
        when 1
            @delivery_status = '商品準備中'
        when 2
            @delivery_status = '出荷済'
        end
    end
    def show
        
    end
    def confirm
        if params[:address].to_i != 0
            @address = Address.find(params[:address].to_i)
        end

        @payment_num = params[:payment_method].to_i
        case @payment_num
        when 0
            @payment = '銀行振込'
        when 1
            @payment = 'クレジットカード支払い'
        when 2
            @payment = '代引き'
        end
    end
    def create
        @order = current_end_user.orders.build(
            purchase_price_total: current_end_user.cart_total_price,
            payment_method: params[:payment_num].to_i,
            postage: 500,
            delivery_status: 0
        )
        if params[:address_id].to_i == 0
            @order.delivery_name = current_end_user.last_name + current_end_user.first_name
            @order.delivery_postal_code = current_end_user.main_postal_code
            @order.delivery_address = current_end_user.main_address
        else
            @address = Address.find(params[:address_id].to_i)
            @order.delivery_name = @address.delivery_name
            @order.delivery_postal_code = @address.delivery_postal_code
            @order.delivery_address = @address.delivery_address
        end
        @order.save
            current_end_user.cart_products.each do |cart_product|
                order_detail = @order.order_details.build(
                    product_id: cart_product.product.id,
                    purchase_price: cart_product.quantity * cart_product.product.amount
                )
                order_detail.save
                cart_product.destroy
            end
        redirect_to order_path(@order.id)
    end
    def new
    end
end


