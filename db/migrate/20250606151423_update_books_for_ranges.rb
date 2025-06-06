class UpdateBooksForRanges < ActiveRecord::Migration[7.1]
  def change
    # Change YL from decimal to string to support ranges like "0.8-1.4"
    change_column :books, :yomiyasusa_level, :string
    
    # Change word_count from integer to string to support ranges like "700-1500"
    change_column :books, :word_count, :string
    
    # Add columns for calculated min/max values for efficient searching
    add_column :books, :yl_min, :decimal, precision: 3, scale: 1
    add_column :books, :yl_max, :decimal, precision: 3, scale: 1
    add_column :books, :word_count_min, :integer
    add_column :books, :word_count_max, :integer
    add_column :books, :word_count_avg, :integer
  end
end
