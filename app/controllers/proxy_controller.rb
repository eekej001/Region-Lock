class ProxyController < ApplicationController
 skip_before_action :verify_authenticity_token
  def index

  	#if params[:id]
    #	redirect_to "https://www.emanga.com"
   # else	
   		 #@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
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



  def query
    fname = params[:username]
    #@matchup = Form.where(:first_name => fname).first
    @matchup = Form.where(:first_name => fname)
    #@matchup = Form.where(:first_name => '#{fname}').first
    render :json => @matchup



    #### MANUAL JSON TEXT SEND  #####   
    #render :json => '{"name":"Testing", "age":31, "city":"Los Angeles"}'
    #### END #####
    

    #matchupS = matchup.to_s

    #matchup = Form.where(:first_name => "IT3").first
    #matchupN = matchup.last_name
    #render :json => matchupN
    
    #render :json => '"Testing"'
    #render :html => "<p>Testing</p>"
    #render :json => matchupS
   # redirect_to(:action => 'index') 

=begin
   respond_to do |format|
     format.html
     format.json { render :json => matchup }
   end
=end

=begin
    if request.xhr?
        render :json => { matchup }
     end
=end


  end



  def dropbox
  	require 'dropbox_sdk'
    
  	#dbsession = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
  	#client = DropboxClient.new(dbsession, DROPBOX_APP_MODE)
    
    #flow = DropboxOAuth2FlowNoRedirect.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET) 
    client = DropboxClient.new(DROPBOX_ACCESS_TOKEN) 
    @dbImage = client.get_file('/Doujinshi/MG59_000.gif')
    @dbImageR = @dbImage.gsub("\u0000", '')
    @filename = "#{Rails.root}/public/puppy.jpg"
    send_file @filename, :type => 'image/gif', disposition: "inline", :x_sendfile=> true
   #send_file @dbImageR, :type => 'image/gif', disposition: "inline", :x_sendfile=> true

    #@clientinfo = client.account_info()


    #/Godzilla/Production/Group%20100/Harlequin%202014/DE-%20A%20Paper%20Marriage/-GIF-1200/MG59_000.gif
    #/Doujinshi/MG59_000.gif
    

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

  def image_test(blank=nil)
    require 'base64'
  	@filename = "#{Rails.root}/public/puppy.jpg"
  	@filenameEnc = Base64.encode64(@filename)

  	#send_data @filenameEnc, :type => 'text/plain', disposition: "inline", :x_sendfile=> true

    send_file @filename, :type => 'image/jpg', disposition: "inline", :x_sendfile=> true

  end	


  def webhook
=begin	
  	webhook_json = JSON.parse request.body.read
  	fn = webhook_json["billing_address"]["first_name"]
  	ln = webhook_json["billing_address"]["last_name"]
  	Form.create(:first_name => "#{fn}", :last_name => "#{ln}")
=end
  end	


  def proxy
    redirect_to "https://www.projecthentai.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end