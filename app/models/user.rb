class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :import_orders, dependent: :destroy
  has_many :export_orders, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  def generate_token
    exp = 24.hours.from_now.to_i
    JWT.encode({ user_id: id, exp: exp }, Rails.application.secret_key_base)
  end

  def admin?
    role == 'admin'
  end

  # Simplified destroy method
  def destroy_with_associations
    # Destroy import and export orders
    import_orders.destroy_all
    export_orders.destroy_all

    # Finally, destroy the user
    destroy
  end
end
