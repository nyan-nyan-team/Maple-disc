class AddressesController < ApplicationController
def create
    @end_user = EndUser.find(params[:id])
    @newaddress = Address.new(address_params)
    @newaddress.save
    redirect_to end_user_path(@end_user)
end
    private
    def address_params
        params.require(:addresses).permit(:delivery_name, :delivery_postal_code, :delivery_address)
    end
end
