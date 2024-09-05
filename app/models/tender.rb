class Tender < ApplicationRecord
    validates :tender_number, presence: true, uniqueness: true
    validates :company, :tender_fee, :application_deadline, :category, :tender_description, presence: true
  
    before_validation :generate_tender_number, on: :create
  
    private
  
    def generate_tender_number
      self.tender_number = "EIG/PREQ/#{SecureRandom.hex(2).upcase}/#{Date.current.year}-#{Date.current.year + 3}"
    end
  end
  