class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def invited(event, user)
        begin
            event.invited.find(user.id)
        rescue => exception
            false
        end
    end

    helper_method :invited

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
    
end
