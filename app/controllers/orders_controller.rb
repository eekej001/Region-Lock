class OrdersController < ApplicationController

 def index
 	@orders = Order.all
 end	



def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order Created"
      redirect_to(action: 'index')
     # redirect_to(action: 'orders', email: params[:email])
    else
      flash[:notice] = "The Order Was Not Created"
      redirect_to(action: 'index')
    end  

  end



def delete
    @order = Order.find(params[:id])
 end

 def destroy
    order = Order.find(params[:id]).destroy
    flash[:notice] = "The order has been successfully deleted."
    redirect_to(action: 'index')
  end



  private 


    def order_params
      params.require(:order).permit(:first_name, :last_name, :email, :title) 
    end 




end
