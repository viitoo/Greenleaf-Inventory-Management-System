class Item < ActiveRecord::Base
  self.per_page = 25
  belongs_to :item

  # attr_accessible :description, :property, :device_name, :serial_number, :product_model_number, :quantity, :category, :department, :warrenty_date

  def self.search(search)
    where("serial_number LIKE ? OR device_name LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Item.create! row.to_hash
    end
  end

end
