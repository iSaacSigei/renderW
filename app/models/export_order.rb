class ExportOrder < ApplicationRecord
  belongs_to :user
  has_many_attached :images # Ensure this line is present for Active Storage

  validates :export_to, :product, :units, :product_description, :company_name, :address, :city, :state_province, :contact, presence: true
end
