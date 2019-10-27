class CartProductsController < ApplicationController
    before_action :authenticate_end_user!
    
def index
    @cart_product = current_end_user.cart_products
end
def update
    cart_product = CartProduct.find(params[:id])
    cart_product.quantity =  params[:cart_product][:quantity].to_i
    cart_product.save
    redirect_to cart_products_path
end
def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
end 
def create
    cart_product = CartProduct.new(end_user_id: current_end_user.id, product_id: params[:cart_product][:product_id], quantity: params[:cart_product][:quantity] )
    cart_product.save
    redirect_to cart_products_path
end

end