class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.string :title
      t.string :languages
      t.string :key_words_bug
      t.string :key_words_solution
      t.boolean :solved, default: false 
      t.timestamps
    end
  end
end
