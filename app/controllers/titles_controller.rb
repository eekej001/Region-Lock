class TitlesController < ApplicationController

 def index
      @doujinshis = Doujinshi.all
 end

 def edit
    #@doujinshi = Doujinshi.find(params[:id])
 end


 def update
    @doujinshi = Doujinshi.find(params[:id])
    if @doujinshi.update_attributes(title_params)
      flash[:notice] = "Title updated successfully."
      redirect_to(:action => 'index')
    else  
      render('edit')
    end  
  end 



  private 

    def title_params
      params.require(:doujinshi).permit(:title) 
    end 

 
end
