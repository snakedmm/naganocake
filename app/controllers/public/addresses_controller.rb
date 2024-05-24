class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @customer = current_customer
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:success] = "新しい配送先の登録が完了しました。"
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      flash[:danger] = "新しい配送先内容に不備があります。"
      redirect_to index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       flash[:success] = "配送先の変更内容を保存しました。"
       redirect_to addresses_path
    else
       flash[:danger] = "配送先の変更内容に不備があります。"
       redirect_to edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to addresses_path
  end
  
  private
  
  def address_params
  params.require(:address).permit(:name, :post_code, :address)
  end
end
