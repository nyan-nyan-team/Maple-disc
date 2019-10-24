class Admin::GenresController < Admin::Base
    #before_action :authenticate_admin!

def new
    @genres = Genre.all
    @genre = Genre.new
end
def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to new_admin_product_path
end
def edit
    @genre = Genre.find(params[:id])
end
def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to new_admin_product_path
end

def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to new_admin_product_path
end

private
def genre_params
    params.require(:genre).permit(:genre_name)
end


end
