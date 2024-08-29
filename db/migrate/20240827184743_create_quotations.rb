class CreateQuotations < ActiveRecord::Migration[7.2]
  def change
    create_table :quotations do |t|
      t.references :export_order, null: true, foreign_key: true
      t.references :import_order, null: true, foreign_key: true
      t.decimal :price_per_unit, precision: 10, scale: 2
      t.decimal :custom_clearance_fee, precision: 10, scale: 2
      t.decimal :logistics_fee, precision: 10, scale: 2
      t.decimal :warehouse_fee, precision: 10, scale: 2
      t.decimal :company_commission, precision: 10, scale: 2
      t.decimal :total, precision: 15, scale: 2

      t.timestamps
    end
  end
end
