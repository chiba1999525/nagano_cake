class Public::CustomersController < ApplicationController

  def edit
    @customer = current_customer
  end

  def confirm
  end

  def show
    @customer = current_customer
  end


  def withdraw_processing
    customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    customer.update(is_active: :false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to mypage_public_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :email, :postal_code, :address, :telephonenumber)
  end

end
