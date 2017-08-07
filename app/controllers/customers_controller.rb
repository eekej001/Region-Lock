class CustomersController < ApplicationController

 def index
 	@customers = Order.pluck('DISTINCT email')
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
