class AddProjectIdToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :project_id, :integer

  end
end
