class Admin::OrderDetailsController < Admin::Base

    before_action :authenticate_admin!

    PER = 4

def index
    @user = EndUser.with_deleted.find(params[:end_user_id])
    @order = @user.orders.page(params[:page]).per(PER)
end
def show
    
end
def edit
end

end