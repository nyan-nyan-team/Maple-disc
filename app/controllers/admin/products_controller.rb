class Admin::ProductsController < Admin::Base
PER = 3
def index
    @products = Product.page(params[:page]).per(PER)
end 

def show
    @product = Product.find(params[:id])
end

def new
    @products = Product.all
    @product = Product.new
    @disc = @product.discs.build
    @music = @disc.musics.build
    @arrival = Arrival.new
end
def edit
    
    @product = Product.find(params[:id])
end

def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path(product)
end

def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path(product)
end

def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path
end


private
def product_params
    params.require(:product).permit(:id, :title, :image, :artist_id, :genre_id, :label_id, :amount, :explanation, :status, :destroy, discs_attributes: [:id, :disc_number, :_destroy, musics_attributes: [:id, :music_name, :_destroy]])
end


end
