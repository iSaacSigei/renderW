class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.string :category
      t.text :job_description
      t.text :job_requirements
      t.date :application_deadline
      t.integer :years_of_experience
      t.string :job_level

      t.timestamps
    end
  end
end
