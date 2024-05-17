class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      flash.now[:alert] = "保存に失敗しました"
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def index
    @items = Item.all
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end
  
end
