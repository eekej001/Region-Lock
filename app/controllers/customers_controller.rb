class CustomersController < ApplicationController

 def index
 	@customers = Order.select('DISTINCT email')
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
