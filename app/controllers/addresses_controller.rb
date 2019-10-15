class AddressesController < ApplicationController
def create
    @end_user = EndUser.find(params[:end_user_id])
    @newaddress = Address.new(address_params)
    @newaddress.end_user_id = current_end_user.id
    @newaddress.save
    redirect_to end_user_path(@end_user.id)
end
    private
    def address_params
        params.require(:address).permit(:delivery_name, :delivery_postal_code, :delivery_address)
    end
end
