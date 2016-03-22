class AddStartUserToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :start_user_id, :integer
  end
end
