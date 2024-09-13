class Tender < ApplicationRecord
    validates :tender_number, presence: true, uniqueness: true
    validates :company, :tender_fee, :application_deadline, :category, :tender_description, presence: true
  
  end
  