class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    cart_item_params_with_amount = cart_item_params.merge(amount: params[:cart_item][:quantity])

    @cart_item = CartItem.new(cart_item_params_with_amount)
    @cart_item.customer_id = current_customer.id

    if existing_cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
      existing_cart_item.amount += @cart_item.amount.to_i
      existing_cart_item.save
      redirect_to cart_items_path
    else
      if @cart_item.save
        redirect_to cart_items_path
      else
        render :new
      end
    end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートを空にしました'
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path, notice: '商品を削除しました'
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end