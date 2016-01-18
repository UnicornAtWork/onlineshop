class Product < ActiveRecord::Base # This declaration means that your product class is a subclass of, or inherits from, the ActiveRecord::Base class, which is the Rails library that provides logic for the model. 
	has_many :orders
end