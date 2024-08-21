class CreateExportOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :export_orders do |t|
      t.string :export_to
      t.string :product
      t.integer :units
      t.text :product_description
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state_province
      t.string :contact
      t.boolean :request_quotation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
