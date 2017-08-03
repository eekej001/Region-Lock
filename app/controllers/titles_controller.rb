class TitlesController < ApplicationController

 def index
      @doujinshis = Doujinshi.all
    end

end
