class CartProductsController < ApplicationController
    before_action :authenticate_end_user!
def index
    @cart_product = current_end_user.cart_products
end
def update
    cart_product = CartProduct.find(params[:id])
    cart_product.quantity =  params[:cart_product][:quantity].to_i
    cart_product.save
    redirect_to edit_cart_product_path(current_end_user.id)
end
def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
end 
def create
    cart_product = CartProduct.new(current_end_user.products.cart_products)
    cart_product.save
    redirect_to cart_products_path
end
end