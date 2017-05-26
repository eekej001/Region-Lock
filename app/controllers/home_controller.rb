class HomeController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
  def index

  	#if params[:id]
    #	redirect_to "https://www.emanga.com"
   # else	
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
       @users = Form.all
  #	end
     
     #filename = File.join(Rails.root, "/public/signup.html")
     #send_file(filename, :filename => "signup.html", :type => 'application/liquid', :disposition => "inline")

  end


  def create
   # @form = Form.new(form_params)
   # if @form.save
   #   flash[:notice] = "Form saved successfully."
   #   redirect_to(:action => 'index')
   # else
   #   flash[:notice] = "Form save unsuccessful."
   #   redirect_to(:action => 'index')   
   # end  
#####    #redirect_to(:action => 'index') 

    @form2 = Form.new(:first_name => "DoesIt", :last_name => "Work")
      if @form2.save
        flash[:notice]= "The second form saved"
        redirect_to(:action => 'index')
      else
         flash[:notice] = "It did not save"
         redirect_to(:action => 'index')
      end  



  end



  def proxy
    redirect_to "https://www.emanga.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end