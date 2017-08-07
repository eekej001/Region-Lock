class CustomersController < ApplicationController

 def index
 	@customers = Order.select(:first_name, :last_name, :email).distinct
      #@customers = Order.sorted.uniq{|x| x.email }
 end


 def orders
    @orders = Order.where(email: params[:email])
 end


def edit
    @order = Order.find(params[:id])
 end


 def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:notice] = "Order updated successfully."
      redirect_to(:action => 'index')
    else  
      render('edit')
    end  
  end 

def delete
    @order = Order.find(params[:id])
 end

 def destroy
    order = Order.find(params[:id]).destroy
    flash[:notice] = "The order has been successfully deleted."
    redirect_to(:action => 'index')
  end

  private 

    def order_params
      params.require(:order).permit(:first_name, :last_name, :email, :title) 
    end 



end
