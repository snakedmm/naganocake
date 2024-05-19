class Public::CustomersController < ApplicationController
  
  def show
<<<<<<< HEAD
    @customer=current_customer
  end
  
  def edit
    
=======
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
>>>>>>> f44439a (会員情報編集、退会機能)
  end
  
  # 顧客の退会確認画面
  def confirm
<<<<<<< HEAD
    
  end
  
  def update
    
=======
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to customers_my_page_path(@customer)
    else
      render :edit
    end
>>>>>>> f44439a (会員情報編集、退会機能)
  end
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw
<<<<<<< HEAD
    
=======
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
>>>>>>> f44439a (会員情報編集、退会機能)
  end
end
