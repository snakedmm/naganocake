class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def index
    @items = Item.where(is_active: true).page(params[:page])
    @genres = Genre.all
  end
end
