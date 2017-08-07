class CustomersController < ApplicationController

 def index
 	@customers = Order.all
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
