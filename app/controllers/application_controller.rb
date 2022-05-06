class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_admin_sign_in_path_for(resource)
   admin_root_path
  end

  def after_admin_sign_up_path_for(resource)
   admin_root_path
  end

  def after_customer_sign_up_path_for(resource)
     mypage_public_customers_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end


  def reject_cusotmer
    @customer = Customer.find_by(name: params[:user][:name])
    if @customer
      if @customer.valid_password?(params[:user][:password]) && (@customer.delete == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end
