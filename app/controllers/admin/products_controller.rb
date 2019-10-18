class Admin::ProductsController < Admin::Base

def index
    @products = Product.all
end 

def show
    @product = Product.find(params[:id])
    @products = Product.all
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
    product = product.find(params[:id])
    product.destroy
    redirect_to admin_product_path
end

# :image_idが足りないが入れると”image_id_id_will_change!”というエラーが出る
private
def product_params
    params.require(:product).permit(:id, :title, :artist_id, :genre_id, :label_id, :amount, :explanation, :status, discs_attributes: [:id, :explanation, :done, :_destroy, musics_attributes: [:id, :explanation, :_destroy]])
end


end
