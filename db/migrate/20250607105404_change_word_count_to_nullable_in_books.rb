class ChangeWordCountToNullableInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :word_count, true
  end
end
