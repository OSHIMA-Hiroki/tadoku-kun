class RemoveUniqueConstraintFromReadingLogs < ActiveRecord::Migration[7.1]
  def change
    # Remove the unique index that prevents multiple readings of the same book
    remove_index :reading_logs, name: "index_reading_logs_on_user_id_and_book_id"
    
    # Add a non-unique index for performance (optional but recommended)
    add_index :reading_logs, [:user_id, :book_id], name: "index_reading_logs_on_user_and_book"
  end
end
