class CustomersController < ApplicationController

 def index
      @customers = Order.sorted
 end


end
