class Admin::ProductsController < Admin::Base

def index
    @products = Product.all
end 
def show
    @products = Product.all
end
def new
    @products = Product.all
    @product = Product.new
    @disc = @product.discs.build
    @music = @disc.musics.build
end
def edit
    @product = Product.find(params[:id])
end

def create
    product = Product.new(product_params)
    product.save
    redirect_to product_path(@product)
end

def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product_path(@product)
end

def delete
end

private
def product_params
    params.require(:product).permit(:title, :image_id, :amount, :explanation, discs_attributes: [:id, :explanation, :done, :_destroy, musics_attributes: [:id, :explanation, :_destroy]])
end


end
