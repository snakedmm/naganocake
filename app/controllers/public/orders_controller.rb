class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800
    if @order.save
      cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart_item.amount  
        @order_detail.price = cart_item.item.add_tax_price
        @order_detail.save
      end
      cart_items.destroy_all
      redirect_to orders_finish_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
    elsif params[:order][:address_number] == "2"
      selected_address = Address.find(params[:order][:registered])
      @order.name = selected_address.name
      @order.address = selected_address.address
      @order.post_code = selected_address.post_code
    elsif params[:order][:address_number] == "3"
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
      @order.post_code = params[:order][:post_code]
    else
      redirect_to new_order_path
      return
    end
    @cart_items = current_customer.cart_items.all
    @total = CartItem.calculate_total_price(@cart_items)
    render :confirm
  end
  
  def finish
  end

  def index
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :post_code, :total_payment, :payment_method, :shipping_cost)
  end
end