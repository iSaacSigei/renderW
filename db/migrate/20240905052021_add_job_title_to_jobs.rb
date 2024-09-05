class AddJobTitleToJobs < ActiveRecord::Migration[7.2]
  def change
    add_column :jobs, :job_title, :string
  end
end
