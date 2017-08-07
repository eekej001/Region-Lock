class CustomersController < ApplicationController

 def index
 	@customers = Order.select('distinct email').map(&:email)
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
