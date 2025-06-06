class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.decimal :yomiyasusa_level, precision: 3, scale: 1
      t.integer :word_count
      t.string :isbn
      t.string :author

      t.timestamps
    end

    add_index :books, :title
    add_index :books, :yomiyasusa_level
    add_index :books, :word_count
    add_index :books, :isbn, unique: true
  end
end
