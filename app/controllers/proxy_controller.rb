class ProxyController < ApplicationController
 skip_before_action :verify_authenticity_token
  def index

  	#if params[:id]
    #	redirect_to "https://www.emanga.com"
   # else	
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  #	end
  end


  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "Form saved successfully."
      redirect_to "https://www.projecthentai.com"
    else
      flash[:notice] = "Form save unsuccessful."
      redirect_to(:action => 'index')   
    end  
    #redirect_to(:action => 'index') 
  end



  def send
     #write code to send public html file with content-type: application/liquid
     @filename = "#{Rails.root}/public/signup.html"
     send_file @filename, :type => 'application/liquid', :x_sendfile=> true
     #send_file(@filename, :type => 'application/liquid; charset=utf-8')
  end	


  def proxy
    redirect_to "https://www.projecthentai.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end