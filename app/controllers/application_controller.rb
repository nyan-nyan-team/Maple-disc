class ApplicationController < ActionController::Base
    
    # before_action :authenticate_end_user!, only: [:edit, :update, :destroy, :create]
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    def after_sign_in_path_for(resource)
        if admin_signed_in?
            admin_top_path
        else
        end_user_path(current_end_user.id)
        end
    end

    def set_search
        @q = Product.ransack(params[:q])
    end
    
    # def after_sign_in_path_for(resource)
    #     admin_path(current_admin.id)
    # end

    protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :main_postal_code, :main_address,:phone_number,:email])
    end
end