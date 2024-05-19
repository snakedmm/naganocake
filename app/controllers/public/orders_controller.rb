class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def create
    cart_items = current_customer.cart_items.all
      @order = current_customer.orders.new(order_params)
      if @order.save
        cart_items.each do |cart|
          order_item = OrderItem.new
          order_item.item_id = cart.item_id
          order_item.order_id = @order.id
          order_item.order_quantity = cart.quantity
          order_item.order_price = cart.item.price
          order_item.save
        end
        redirect_to orders_finish_path
        cart_items.destroy_all
      else
        @order = Order.new(order_params)
        render :new
      end
    
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.name # @order の各カラムに必要なものを入れます
      @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      else
        render :new
      end
    else
      redirect_to 遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end
  
  private
  def order_params
    params.require(:order).permit(:name, :address, :total_price)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
