class ChangeAuthorAndIsbnToNullableInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :author, true
    change_column_null :books, :isbn, true
  end
end
