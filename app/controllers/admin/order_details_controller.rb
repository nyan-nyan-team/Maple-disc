class Admin::OrderDetailsController < Admin::Base
    PER = 4
def index
    @order = Order.page(params[:page]).per(PER)
end
def show
    
end
def edit
end

end
