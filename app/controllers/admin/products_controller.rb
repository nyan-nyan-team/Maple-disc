class Admin::ProductsController < Admin::Base
    before_action :authenticate_admin!

PER = 8

def index
    @products = Product.with_deleted.page(params[:page]).per(PER)
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
    @artists = Artist.all.order(id: "DESC")
    @artist = Artist.new
    @genres = Genre.all.order(id: "DESC")
    @genre = Genre.new
    @labels = Label.all.order(id: "DESC")
    @label = Label.new
end
def edit
    
    @product = Product.find(params[:id])
end

def create
    product = Product.new(product_params)
    if product.save
        redirect_to admin_product_path(product)
    else
        redirect_to new_admin_product_path , notice:"商品の追加に失敗しました。"
    end
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
