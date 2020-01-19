class AddUserEmailToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :user_email, :string

  end
end
