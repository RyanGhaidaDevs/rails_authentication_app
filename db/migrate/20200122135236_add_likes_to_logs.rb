class AddLikesToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column(:logs, :likes, :integer, default: 0, null: false) 
  end
end
