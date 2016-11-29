class HomeController < ShopifyApp::AuthenticatedController
  def index

  	if params[:id]
    	redirect_to "https://www.google.com"
    else	
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
   	end

  end
end
