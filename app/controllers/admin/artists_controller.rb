class Admin::ArtistsController < Admin::Base
    protect_from_forgery :expect => [:create, :destroy]
    #before_action :authenticate_admin!
    
def new
    @artists = Artist.all
    @artist = Artist.new
end

def edit
    @artist = Artist.find(params[:id])
end

def create
    @artist = Artist.new(artist_name: params[:artist])
    @artist.save
end

def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to new_admin_product_path
end

def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
end

private
def artist_params
    params.require(:artist).permit(:artist_name)
end

end
