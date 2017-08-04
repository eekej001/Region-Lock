class Doujinshi < ActiveRecord::Base
	validates_presence_of :title

	scope :sorted, lambda { order("title ASC")}     
end
