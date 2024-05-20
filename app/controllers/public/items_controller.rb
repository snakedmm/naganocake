class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  def index
    @items = Item.where(is_active: true)
  end
end
