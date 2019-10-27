class AddressesController < ApplicationController
    before_action :authenticate_end_user!

def create
    @end_user = EndUser.find(params[:end_user_id])
    @newaddress = Address.new(address_params)
    @newaddress.end_user_id = current_end_user.id
    if @newaddress.save
        flash[:end_user_address] = "お届け先住所を追加しました。"
    redirect_to end_user_path(@end_user.id)
    end
end
    private
    def address_params
        params.require(:address).permit(:delivery_name, :delivery_postal_code, :delivery_address)
    end
end
