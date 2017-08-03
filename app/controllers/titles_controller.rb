class TitlesController < ApplicationController

 def index
      @titles = Doujinshi.all
    end

end
