class EndUsersController < ApplicationController
    before_action :authenticate_end_user!
    before_action :correct_end_user, only: [:show, :edit, :update]
    
    
def show
    @end_user = EndUser.find(params[:id])
    @full_name = @end_user.last_name + @end_user.first_name
    @full_name_kana = @end_user.last_name_kana + @end_user.first_name_kana
    @phone_number = @end_user.phone_number
    @email = @end_user.email
    @main_postal_code = @end_user.main_postal_code
    @main_address = @end_user.main_address
    @addresses = @end_user.addresses
end
def edit
    @end_user = EndUser.find(params[:id])
    @newaddress = Address.new
end
def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    flash[:end_user] = "マイページを編集しました。"
    redirect_to end_user_path(end_user)
end
def create
end
def out
end
def destroy
    end_user = EndUser.find(params[:id])
    end_user.destroy
    redirect_to root_path
end


private
def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :main_postal_code, :main_address, :phone_number, :email)
end

def correct_end_user
    end_user = EndUser.find(params[:id])
    if current_end_user != end_user
    redirect_to end_user_path(current_end_user.id)
    end
end
end
