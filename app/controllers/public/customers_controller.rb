class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer=current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  # 顧客の退会確認画面
  def confirm
    
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_my_page_path(@customer)
    else
      redirect_to request.referer
    end
  end
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
