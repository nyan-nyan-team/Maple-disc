class Admin::GenresController < Admin::Base
    protect_from_forgery :expect => [:create, :destroy]
    #before_action :authenticate_admin!

def new
    @genres = Genre.all
    @genre = Genre.new
end
def create
    @genre = Genre.new(genre_name: params[:genre])
    @genre.save
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
    @genre = Genre.find(params[:id])
    @genre.destroy
end

private
def genre_params
    params.require(:genre).permit(:genre_name)
end


end
