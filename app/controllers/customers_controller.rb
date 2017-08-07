class CustomersController < ApplicationController

 def index
 	@customers = Order.uniq.pluck(:email)
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
