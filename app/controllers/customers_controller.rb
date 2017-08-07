class CustomersController < ApplicationController

 def index
      @customers = Order.sorted.uniq{|x| x.email}
 end


end
