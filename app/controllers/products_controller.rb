class ProductsController < ApplicationController
    before_action :authenticate_end_user!
def index
end 
def show
    @product = Product.find(params[:id])
end
end