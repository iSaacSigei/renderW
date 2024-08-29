class Quotation < ApplicationRecord
  belongs_to :export_order, optional: true
  belongs_to :import_order, optional: true
  belongs_to :admin_user, class_name: 'User', optional: true

  validates :price_per_unit, :custom_clearance_fee, :logistics_fee, :warehouse_fee, presence: true
  validate :either_import_or_export_order_present

  private

  def either_import_or_export_order_present
    if export_order.nil? && import_order.nil?
      errors.add(:base, "Quotation must be associated with either an ImportOrder or an ExportOrder.")
    elsif export_order.present? && import_order.present?
      errors.add(:base, "Quotation cannot be associated with both an ImportOrder and an ExportOrder.")
    end
  end
end
