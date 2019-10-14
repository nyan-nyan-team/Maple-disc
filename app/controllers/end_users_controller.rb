class EndUsersController < ApplicationController
def show
    @end_user = current_end_user
    @full_name = @end_user.last_name + @end_user.first_name
    @full_name_kana = @end_user.last_name_kana + @end_user.first_name_kana
    @phone_number = @end_user.phone_number
    @email = @end_user.email
    @main_postal_code = @end_user.main_postal_code
    @main_address = @end_user.main_address
end
def edit
    @end_user = EndUser.find(params[:id])
    @address = Address.new
end
def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to end_user_path(end_user)
end

def create
end
def out
end
def delete
end


private
def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :main_postal_code, :main_address, :phone_number, :email)
end
end
