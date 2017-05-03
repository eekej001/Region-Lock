class HomeController < ShopifyApp::AuthenticatedController
  def index

  	if params[:id]
    	redirect_to "https://www.emanga.com"
    else	
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  	end
  end


  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "Form saved successfully."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Form save unsuccessful."
      redirect_to(:action => 'index')   
    end  
    #redirect_to(:action => 'index') 
  end



  def proxy
    redirect_to "https://www.emanga.com"
  end 	


end
