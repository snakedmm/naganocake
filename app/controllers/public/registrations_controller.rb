# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_sign_up_params, if: :devise_controller?


  # If you have extra params to permit, append them to the sanitizer.
  
  def after_sign_up_path_for(resource)
    customers_my_page_path(resource)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, ])
  end
end
