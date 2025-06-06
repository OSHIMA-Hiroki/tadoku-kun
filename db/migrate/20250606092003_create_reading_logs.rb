class CreateReadingLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :read_at, null: false
      t.text :notes

      t.timestamps
    end

    add_index :reading_logs, [:user_id, :book_id], unique: true
    add_index :reading_logs, :read_at
  end
end
