class RemoveLogsIdFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :log_id, :integer
  end
end
