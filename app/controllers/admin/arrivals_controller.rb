class Admin::ArrivalsController < Admin::Base
    PER = 5
def index
    @arrival = Arrival.new
    @arrivals = Arrival.page(params[:page]).per(PER)
end
def new
    @arrival = Arrival.new

end 
def edit
    @arrival = Arrival.find(params[:id])
end
def create
    @arrival = Arrival.new(arrival_params)
    if
    @arrival.save
    redirect_to admin_arrivals_path
    else
    render :new
    end
end
def update
    arrival = Arrival.find(params[:id])
    if arrival.update(arrival_params)
        redirect_to admin_arrivals_path
    else
        render
    end
end
def destory
    arrival = Arrival.find(params[:id])
    if arrival.destroy
    redirect_to admin_arrivals_path
    else
    render :edit
    end
end

private
def arrival_params
    params.require(:arrival).permit(:product_id, :quantity, :arrival_date, :arrival_time)
end

end

