class CustomersController < ApplicationController

 def index
 	@customers = Order.select(:email).distinct
      #@customers = Order.sorted.uniq{|x| x.email }
 end


end
