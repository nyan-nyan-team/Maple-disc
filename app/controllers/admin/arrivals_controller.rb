class Admin::ArrivalsController < Admin::Base
def index
end
def new
end 
def edit
end
def create
    arrival = Arrival.new(quantity)
    arrival.save
    redirect_to new_admin_product_path
end
def update
end
def delete
end

private
def arrival_params
    params.require(:arrival).permit(:quantity)
end

end