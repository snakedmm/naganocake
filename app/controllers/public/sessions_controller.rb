# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  
 protected

  def after_sign_out_path_for(resource)
    root_path
  end
  
  
 private
 # アクティブであるかを判断するメソッド
  def customer_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    customer = Customer.find_by(email: params[:customer][:email])
    # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return if customer.nil?
    # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless customer.valid_password?(params[:customer][:password])
  
    # 【処理内容4】 アクティブでない会員に対する処理
    if !customer.is_active
    # アカウントが有効化されていない場合の処理を記述
    # 例えば、エラーメッセージを表示したり、特定のページにリダイレクトさせたりすることができます
    flash[:alert] = "アカウントが有効化されていません。"
    redirect_to new_customer_registration_path and return
    end
  end
end
