class AddEndUserToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :end_user, :integer
  end
end
