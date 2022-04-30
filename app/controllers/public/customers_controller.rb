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
  end

end
