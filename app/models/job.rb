class Job < ApplicationRecord
    validates :category, :job_description, :application_deadline, :years_of_experience, :job_level, presence: true
    validates :requirements, presence: true, if: -> { requirements.present? }
    validates :benefits, presence: true, if: -> { benefits.present? }
  end
  