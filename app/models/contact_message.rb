class ContactMessage < ApplicationRecord
    validates :name, :number, :email, :message, presence: true
end
