class Admin::EndUsersController < Admin::Base
def index
    @end_users = EndUser.all
    @end_user = EndUser.new
end 
def show
    @enduser = EndUser.find(params[:id])
end
def edit
end
def out
end
def update
end
def delete
end

end
