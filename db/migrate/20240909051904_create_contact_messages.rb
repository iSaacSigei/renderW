class CreateContactMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :contact_messages do |t|
      t.string :name
      t.string :number
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
