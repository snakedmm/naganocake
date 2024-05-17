class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end
  
end
