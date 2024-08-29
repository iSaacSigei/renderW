class AddAdminUserIdToQuotations < ActiveRecord::Migration[7.2]
  def change
    add_column :quotations, :admin_user_id, :integer
  end
end
