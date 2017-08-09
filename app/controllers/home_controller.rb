class HomeController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
  def index

  	#if params[:id]
    #	redirect_to "https://www.emanga.com"
   # else	
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
       @users = Form.all
       @doujinshis = Doujinshi.all
       @doujinshi_count = Doujinshi.count - 1
  #	end
     
     #filename = File.join(Rails.root, "/public/signup.html")
     #send_file(filename, :filename => "signup.html", :type => 'application/liquid', :disposition => "inline")

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

    
    def customers
      @orders = Order.all
    end   
    


=begin
    @form2 = Form.new(:first_name => "DoesIt", :last_name => "Work")
      if @form2.save
        flash[:notice]= "The second form saved"
        redirect_to(:action => 'index')
      else
         flash[:notice] = "It did not save"
         redirect_to(:action => 'index')
      end  
=end

=begin

     Form.create(:first_name => "No", :last_name => "Ifs")
     flash[:notice] = "No ifs ands or buts about it"
     redirect_to(:action => 'index')

=end


  end


  def d_create
    @douj = Doujinshi.new(douj_params)
    if @douj.save
      flash[:notice] = "Doujinshi Title Added"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Doujinshi Title Was Not Added"
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

    def douj_params
      params.require(:doujinshi).permit(:title)
    end