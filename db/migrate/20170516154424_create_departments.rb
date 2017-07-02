class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
