class AddFieldsToJobs < ActiveRecord::Migration[7.2]
  def change
    add_column :jobs, :requirements, :text, array: true, default: []
    add_column :jobs, :benefits, :text, array: true, default: []
    add_column :jobs, :how_to_apply, :text
    add_column :jobs, :contact_email, :string
    add_column :jobs, :contact_phone, :string
  end
end
