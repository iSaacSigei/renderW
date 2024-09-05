class Job < ApplicationRecord
    validates :category, :job_description, :job_requirements, :application_deadline, :years_of_experience, :job_level, presence: true
  end
  