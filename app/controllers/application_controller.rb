class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name city photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[photo])
  end

  def after_sign_in_path_for(resource)
    if current_user.doctor
      consultations_path
    else
      my_consultations_path
    end
  end

  def after_update_path_for(resource)
    if current_user.doctor
      consultations_path
    else
      my_consultations_path
    end
  end
end
