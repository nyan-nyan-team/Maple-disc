class Admin::LabelsController < Admin::Base
def new
    @labels = Label.all
    @label = Label.new
end
def edit
    @label = Label.find(params[:id])
end
def create
    label = Label.new(label_params)
    label.save
    redirect_to new_admin_label_path
end
def update
    label = Label.find(params[:id])
    label.update(label_params)
    redirect_to new_admin_label_path
end

def delete
end

private
def label_params
    params.require(:label).permit(:label_name)
end

end
