class ProductsController < ApplicationController
    before_action :authenticate_end_user!
    PER = 4
def index
    @product = Product.new
    @products = Product.page(params[:page]).per(PER)
end 
def show
    @product = Product.find(params[:id])
end

end