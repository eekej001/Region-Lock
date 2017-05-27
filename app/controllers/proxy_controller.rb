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


=begin
  def send(blank=nil)
     #write code to send public html file with content-type: application/liquid





     @filename = "#{Rails.root}/public/test.liquid"
     send_file @filename, :type => 'application/liquid', :x_sendfile=> true
   




     #format.html

     #render "#{Rails.root}/public/test.liquid", content_type: 'application/liquid'
     
     #render('index')



     #render :layout => false, :content_type => 'application/liquid' if Rails.env.production?
     #filename = File.join(Rails.root, "/public/signup.html")
     #send_file(filename, :filename => "signup.html", :type => 'text/html', :disposition => "inline")




     #send_file(@filename, :type => 'application/liquid; charset=utf-8')
  end	
=end


  def webhook
  	#webhook_json = JSON.parse request.body.read
  	fn = JSON.parse(params[:billing_address][:first_name].to_json)
  	ln = JSON.parse(params[:billing_address][:last_name].to_json)
  	#@fn = webhook_json["billing_address"][0]["first_name"]
  	#@ln = webhook_json["billing_address"][0]["last_name"]


  	#Form.create(:first_name => "Web", :last_name => "Hook")
  	Form.create(:first_name => "#{fn}", :last_name => "#{ln}")

  end	


  def proxy
    redirect_to "https://www.projecthentai.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end