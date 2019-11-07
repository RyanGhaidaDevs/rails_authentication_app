class AddBugLogsToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.string :bugTitle
      t.string :bugDescription
      t.string :languagesInvolved
      t.string :links
      t.string :notes
      t.string :solution
      t.timestamps
    end
  end
end

