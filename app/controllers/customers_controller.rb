class CustomersController < ApplicationController

 def index
 	@customers = Order.select(:email).uniq
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
