class CustomersController < ApplicationController

 def index
 	@customers = Order.select(:first_name, :last_name, :email).distinct
 end


 def orders
    @orders = Order.where(email: params[:email])
 end


 def create
    @order = Order.new(order_new_params)
    if @order.save
      flash[:notice] = "Doujinshi Title Added To Library"
      redirect_to(action: 'orders', email: @order.email)
     # redirect_to(action: 'orders', email: params[:email])
    else
      flash[:notice] = "Doujinshi Title Was Not Added to this Customer's Library"
      redirect_to(action: 'orders', email: @order.email)
    end  

  end


def edit
    @order = Order.find(params[:id])
 end


 def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:notice] = "Order updated successfully."
      redirect_to(action: 'orders', email: @order.email)
    else  
      redirect_to(action: 'orders', id: @order.id)
    end  
  end 

def delete
    @order = Order.find(params[:id])
 end

 def destroy
    order = Order.find(params[:id]).destroy
    flash[:notice] = "The order has been successfully deleted."
    redirect_to(action: 'orders', email: order.email)
  end

  private 

    def order_params
      params.require(:order).permit(:title) 
    end 

    def order_new_params
      params.require(:order).permit(:first_name, :last_name, :email, :title) 
    end 



end
