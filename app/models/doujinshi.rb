class Doujinshi < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :handle
end
