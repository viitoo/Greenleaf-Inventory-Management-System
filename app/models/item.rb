class Item < ActiveRecord::Base
  attr_accessible :description, :property, :device_name, :serial_number, :product_model_number, :quantity, :category, :department, :owner

self.per_page = 25
def self.search(search)
	if search
		where('device_name LIKE ?',"%#{search}%")	     
	end
end

belongs_to :item
protected
end
