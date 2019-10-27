class Admin::LabelsController < Admin::Base
    protect_from_forgery :expect => [:create, :destroy]
    before_action :authenticate_admin!

def new
    @labels = Label.all
    @label = Label.new
end

def edit
    @label = Label.find(params[:id])
end

def create
    @label = Label.new(label_name: params[:label])
    @label.save
end

def update
    label = Label.find(params[:id])
    label.update(label_params)
    redirect_to new_admin_product_path
end

def destroy
    @label = Label.find(params[:id])
    @label.destroy
end

private
def label_params
    params.require(:label).permit(:label_name)
end

end
