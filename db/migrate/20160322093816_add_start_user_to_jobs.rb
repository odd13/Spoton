class AddStartUserToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :start_user, :integer
  end
end
