class AddEndUserToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :end_user_id, :integer
  end
end
