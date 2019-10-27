class Admin::ArtistsController < Admin::Base
    before_action :authenticate_admin!
    
def new
    @artists = Artist.all
    @artist = Artist.new
end
def edit
    @artist = Artist.find(params[:id])
end
def create
    artist = Artist.new(artist_params)
    if artist.save
    redirect_to new_admin_product_path , notice:"アーティストを追加しました！"
    else
    render new_admin_product_path , notice:"追加に失敗しました。"
    end
end
def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to new_admin_product_path
end

def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to new_admin_product_path
end

private
def artist_params
    params.require(:artist).permit(:artist_name)
end

end
