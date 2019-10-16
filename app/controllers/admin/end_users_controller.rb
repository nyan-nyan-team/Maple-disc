class Admin::EndUsersController < Admin::Base
def index
    @end_users = EndUser.all
    @end_user = EndUser.new
end 
def show
    @enduser = EndUser.find(params[:id])
    @end_user = EndUser.new
end
def edit
    @enduser = EndUser.find(params[:id])
    @end_user = EndUser.new
end
def out
    @enduser = EndUser.find(params[:id])
end
def update
    @enduser = EndUser.find(params[:id])
    if @enduser.update(@enduser_params)
    redirect_to admin_end_users_path(@enduers.id)
    else 
    redirect_to edit_admin_end_users_path(@endusers)
    end
end
def destroy
    @enduser = EndUser.find(params[:id])
    @enduser.destroy
    redirect_to admin_end_users_path
end

private
def end_user_params
   params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :main_postal_code, :main_address, :phone_number, :email)
end
end
