class Admin::OrderDetailsController < Admin::Base
def index
    @orders = Order.all
end
def show
end
def edit
end

end
