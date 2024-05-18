class Public::CustomersController < ApplicationController
  
  def show
    @customer=current_customer
  end
  
  def edit
    
  end
  
  # 顧客の退会確認画面
  def confirm
    
  end
  
  def update
    
  end
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw
    
  end
end
