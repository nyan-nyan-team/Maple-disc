class OrdersController < ApplicationController
    before_action :authenticate_end_user!
    before_action :correct_end_user, only: [:confirm, :create]
    before_action :prevent_get_access, only: [:confirm]
    
    def index
        @orders = current_end_user.orders.page(params[:page]).per(16)
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
        @order = current_end_user.orders.find(params[:id])
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
    def finish
    end
    def before_confirm
        if params[:address].nil?
            flash[:address] = "お届け先住所を選択してください。"
            redirect_to new_order_path
        else
            if params[:address].to_i != 0
                @address = Address.find(params[:address].to_i)
            else
                @address = 0
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
            render :confirm
        end
    end
    def confirm
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
                    purchase_price: cart_product.quantity * cart_product.product.amount,
                    quantity: cart_product.quantity
                    
                )
                order_detail.save
                cart_product.destroy
            end
        redirect_to finish_order_path
    end
    def new
    end

    private
    def correct_end_user
        end_user = current_end_user
        if current_end_user != end_user
        redirect_to product_path
        end
    end
    def prevent_get_access
        redirect_to products_path
    end

end


