class ImportOrder < ApplicationRecord
    belongs_to :user
    has_one :quotation, dependent: :destroy

    validates :import_from, :product, :units, :product_description, :company_name, :address, :city, :state_province, :contact, presence: true
  end
  