module ControllerMacros
    def end_user_login(user)
    # controller.stub(:authenticate_user!).and_return true
        @request.env["devise.mapping"] = Devise.mappings[:end_user]
        sign_in end_user
    end

    def admin_login(admin)
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in admin
    end
end