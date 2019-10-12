class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        end_user_path(current_end_user.id)
    end

    protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :main_postal_code, :main_address,:phone_number,:email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end
end
