class Order < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_presence_of :title

	scope :sorted, lambda { order("title ASC")}    
end
