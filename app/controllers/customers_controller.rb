class CustomersController < ApplicationController

 def index
 	@customers = Order.select(:first_name, :last_name, :email).distinct
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
