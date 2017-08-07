class CustomersController < ApplicationController

 def index
      @customers = Order.uniq{|x| x.email }
 end


end
