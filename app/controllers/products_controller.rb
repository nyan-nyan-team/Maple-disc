class ProductsController < ApplicationController
    before_action :authenticate_end_user!
    PER = 3
def index
    @product = Product.new
    if params[:q]
        @products = @q.result.page(params[:page]).per(PER)
    else
        @products = Product.page(params[:page]).per(PER)

    end 
end

def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
end

end