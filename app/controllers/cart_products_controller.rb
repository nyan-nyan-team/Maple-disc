class CartProductsController < ApplicationController
    before_action :authenticate_end_user!
def edit
end
def update
    cart_product = CartProduct.find(params[:id])
    cart_product.quantity =  params[:cart_product][:quantity].to_i
    cart_product.save
    redirect_to edit_cart_product_path(current_end_user.id)
end
def destroy
end
end