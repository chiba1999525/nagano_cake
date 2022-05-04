class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_customer_sign_in_path_for(resource)
   public_root_path
  end

  def after_customer_sign_up_path_for(resource)
   public_root_path
  end

  def after_customer_sign_out_path_for(resource)
    root_path(resource)
  end



  def after_admin_sign_in_path_for(resource)
   admin_root_path
  end

  def after_admin_sign_up_path_for(resource)
   admin_root_path
  end

  def admin_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end
end
