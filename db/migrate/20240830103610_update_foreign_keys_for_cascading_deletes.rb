class UpdateForeignKeysForCascadingDeletes < ActiveRecord::Migration[7.2]
  def change
    # Remove existing foreign keys
    remove_foreign_key :quotations, :export_orders
    remove_foreign_key :quotations, :import_orders

    # Add foreign keys with on_delete cascade
    add_foreign_key :quotations, :export_orders, on_delete: :cascade
    add_foreign_key :quotations, :import_orders, on_delete: :cascade
  end
end
