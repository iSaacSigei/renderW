class CreateTenders < ActiveRecord::Migration[7.2]
  def change
    create_table :tenders do |t|
      t.string :tender_number
      t.string :company
      t.decimal :tender_fee
      t.date :application_deadline
      t.string :category
      t.text :tender_description

      t.timestamps
    end
  end
end
