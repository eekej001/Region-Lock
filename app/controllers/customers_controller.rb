class CustomersController < ApplicationController

 def index
 	@customers = Order.uniq{ |x| x.email }
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
