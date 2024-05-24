class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status:'awaiting_production') if @order.status == "payment_confirmation"
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_order_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      render :show
    end
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
