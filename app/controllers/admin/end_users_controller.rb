class Admin::EndUsersController < Admin::Base
    PER = 2

def index
    @end_user = EndUser.new
    @end_users = EndUser.with_deleted.page(params[:page]).per(PER)
end 



def show
    @enduser = EndUser.with_deleted.find(params[:id])
    @end_user = EndUser.new
end
def edit
    @enduser = EndUser.find(params[:id])
    @end_user = EndUser.new
end
def out
    @enduser = EndUser.find(params[:id])
    @end_user = EndUser.new
end

def update
    @enduser = EndUser.find(params[:id])
    if @enduser.update(end_user_params)
    redirect_to admin_end_user_path
    else 
    redirect_to edit_admin_end_user_path(@endusers)
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
