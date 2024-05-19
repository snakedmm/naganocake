class Public::HomesController < ApplicationController
  before_action :authenticate_customer!
  skip_before_action :authenticate_customer!, only: [:top, :about, :items]
  
  def top
    @items = Item.order('id DESC').limit(4)
  end
  
  def about
  end

end
