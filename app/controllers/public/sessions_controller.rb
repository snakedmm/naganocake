# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
 protected
 
  def after_sign_in_path_for(resource)
    customers_my_page_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    else
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end
end
