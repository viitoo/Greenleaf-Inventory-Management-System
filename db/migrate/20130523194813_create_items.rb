class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :device_name
      t.string :serial_number
      t.text :description
      t.text :product_model_number
      t.integer :quantity
      t.string :picture
      t.text :category
      t.string :property
      t.string :department
      t.date :warrenty_date

      t.timestamps
    end
  end
end
