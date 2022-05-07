class ApplicationController < ActionController::Base

  

  # def reject_cusotmer
  #   @customer = Customer.find_by(name: params[:user][:name])
  #   if @customer
  #     if @customer.valid_password?(params[:user][:password]) && (@customer.delete == false)
  #       flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
  #       redirect_to new_customer_registration_path
  #     else
  #       flash[:notice] = "項目を入力してください"
  #     end
  #   end
  # end
end
