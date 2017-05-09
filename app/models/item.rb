class Item < ActiveRecord::Base
  attr_accessible :description, :property, :device_name, :serial_number, :product_model_number, :quantity, :category, :department, :owner
def self.search(search)
  where("serial_number LIKE ? OR device_name LIKE ?", "%#{search}%", "%#{search}%")
end
self.per_page = 25
belongs_to :item
protected
end
