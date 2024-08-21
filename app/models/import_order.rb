class ImportOrder < ApplicationRecord
    belongs_to :user
    validates :import_from, :product, :units, :product_description, :company_name, :address, :city, :state_province, :contact, presence: true
  end
  