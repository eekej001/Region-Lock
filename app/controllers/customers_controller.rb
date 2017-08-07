class CustomersController < ApplicationController

 def index
 	@customers = Order.distinct(:email)
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
